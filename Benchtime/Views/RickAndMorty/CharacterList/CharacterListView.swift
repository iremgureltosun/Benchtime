//
//  CharactersView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Resolver
import SwiftUI

struct CharacterListView: View {
    let listItems: [GridItem] = Array(repeating: .init(.fixed(CGFloat(100))), count: 3)
    private let debouncer = Debouncer(duration: .seconds(0.5))
    private let genderOptions = CharacterGender.allCases
    private let statusOptions = CharacterStatus.allCases
    @Injected private var characterService: CharacterService
    @Environment(\.appManager) private var applicationManager
    @State private var state: CharacterListViewState = .init()

    var recordCount: Int {
        characterService.figureList.count
    }

    var body: some View {
        VStack {
            header

            filteringRow
                .padding(.horizontal, 20)
                .padding(.top, -40)

            scrollableContent
        }
        .ignoresSafeArea(edges: [.top])
        .onAppear {
            if !state.hasAppeared {
                Task {
                    try await characterService.fetchAll(page: state.page)
                    state.hasAppeared = true
                }
            }
        }
        .onChange(of: state.searchText, initial: false, { _, text in
            setFilterOfText(text: text)

            Task {
                guard await debouncer.sleep() else { return }
                try await searchByCriteria()
            }
        })
        .onChange(of: state.gender, initial: false, { _, gender in
            setFilterOfGender(gender: gender)
            Task {
                try await searchByCriteria()
            }
        })
        .onChange(of: state.status, initial: false, { _, status in
            setFilterOfStatus(status: status)
            Task {
                try await searchByCriteria()
            }
        })
    }

    func searchByCriteria() async throws {
        if state.filterDictionary.isEmpty {
            try await characterService.fetchAll(page: state.page)
        } else {
            try await characterService.fetchWithCriteria(criteria: Array(state.filterDictionary.values))
        }
    }

    func setFilterOfText(text: String) {
        if !text.isEmpty {
            state.filterDictionary[.name] = CharacterFilterCriteria.name(text: text)
        } else {
            state.filterDictionary[.name] = nil
        }
    }

    func setFilterOfGender(gender: CharacterGender?) {
        if let gender = gender {
            let genderFilter = CharacterFilterCriteria.gender(gender: gender)
            state.filterDictionary[.gender] = genderFilter
        } else {
            state.filterDictionary[.gender] = nil
        }
    }

    func setFilterOfStatus(status: CharacterStatus?) {
        if let status = status {
            let statusFilter = CharacterFilterCriteria.status(status: status)
            state.filterDictionary[.status] = statusFilter
        } else {
            state.filterDictionary[.status] = nil
        }
    }

    @ViewBuilder private var header: some View {
        HeaderView(themeStyle: .desert, title: "Rick and Morty", subtitle: "Characters")
    }

    @ViewBuilder private var content: some View {
        LazyVGrid(columns: listItems, spacing: 20) {
            ForEach(characterService.figureList, id: \.self) { figure in
                // let _ = print(figure)
                getCell(for: figure)
            }
        }
    }

    @ViewBuilder private func getCell(for figure: Figure) -> some View {
        VStack {
            RemoteImageView(url: figure.image, contentMode: .fit)
                .frame(width: 80, height: 80, alignment: .top)
                .clipShape(Circle())

            HStack(alignment: .top, content: {
                Image(systemName: "circle.fill")
                    .foregroundColor(figure.status.color)
                    .font(.caption2)

                Text(figure.name)
                    .lineLimit(2, reservesSpace: true)
                    .font(.caption2)
            })
        }
        .onTapGesture {
            applicationManager.navigate(to: .characterDetail(id: String(figure.id)))
        }
    }

    @ViewBuilder private var filteringRow: some View {
        VStack(alignment: .trailing, content: {
            SearchTextfield(searchText: $state.searchText)

            HStack {
                Spacer()
                Text("Filter by:")
                    .font(.caption)

                Picker("Status", selection: $state.status) {
                    Text("status")
                        .tag(CharacterStatus?.none)

                    ForEach(statusOptions, id: \.self) { option in

                        Text(option.rawValue)
                            .tag(CharacterStatus?.some(option))
                    }
                }
                .pickerStyle(MenuPickerStyle())

                Picker("Gender", selection: $state.gender) {
                    Text("gender").tag(CharacterGender?.none)

                    ForEach(genderOptions, id: \.self) { option in
                        Text(option.rawValue)
                            .tag(CharacterGender?.some(option))
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }

            Text("\(recordCount) records")
                .font(.caption)
        })
    }

    @ViewBuilder private var scrollableContent: some View {
        ScrollView(showsIndicators: false) {
            RefreshableContentView(isRefreshing: $state.isLoading) {
                content
            }
        }
        .coordinateSpace(name: RefreshablePresentModel.homeScrollView)
        .refreshable {
            Task {
                self.state.page += 1
                if !state.filterDictionary.isEmpty {
                    state.gender = nil
                    state.status = nil
                    state.searchText = ""
                } else {
                    try await characterService.fetchAll(page: state.page)
                }
            }
        }
        .onAppear {
            UIRefreshControl.appearance().tintColor = .clear
        }
    }
}

#Preview {
    CharacterListView()
}
