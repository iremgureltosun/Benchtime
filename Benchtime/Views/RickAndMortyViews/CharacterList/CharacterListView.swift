//
//  CharactersView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Resolver
import SwiftUI

struct CharacterListView: View {
    private let listItems: [GridItem] = Array(repeating: .init(.fixed(CGFloat(100))), count: 3)
    private let debouncer = Debouncer(duration: .seconds(0.5))
    private let genderOptions = CharacterGender.allCases
    private let statusOptions = CharacterStatus.allCases
    @Injected private var characterService: CharacterService
    @Environment(\.appManager) private var applicationManager
    @State private var viewState: CharacterListViewState = .init()

    var recordCount: Int {
        characterService.figureList.count
    }

    var body: some View {
        VStack {
            header

            filteringRow
                .padding(.horizontal, Constants.Spaces.mediumSpace)
                .padding(.top, -40)

            scrollableContent
        }
        .ignoresSafeArea(edges: [.top])
        .onAppear {
            Task {
                try await characterService.fetchAll(page: viewState.page)
            }
        }
        .onChange(of: viewState.searchText, initial: false, { _, text in
            viewState.setFilterOfText(text: text)

            Task {
                guard await debouncer.sleep() else { return }
                try await searchByCriteria()
            }
        })
        .onChange(of: viewState.gender, initial: false, { _, gender in
            viewState.setFilterOfGender(gender: gender)
            Task {
                try await searchByCriteria()
            }
        })
        .onChange(of: viewState.status, initial: false, { _, status in
            viewState.setFilterOfStatus(status: status)
            Task {
                try await searchByCriteria()
            }
        })
    }

    private func searchByCriteria() async throws {
        if viewState.filterDictionary.isEmpty {
            try await characterService.fetchAll(page: viewState.page)
        } else {
            try await characterService.fetchWithCriteria(criteria: Array(viewState.filterDictionary.values))
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
            SearchTextfield(searchText: $viewState.searchText)

            HStack {
                Spacer()
                Text("Filter by:")
                    .font(.caption)

                Picker("Status", selection: $viewState.status) {
                    Text("status")
                        .tag(CharacterStatus?.none)

                    ForEach(statusOptions, id: \.self) { option in

                        Text(option.rawValue)
                            .tag(CharacterStatus?.some(option))
                    }
                }
                .pickerStyle(MenuPickerStyle())

                Picker("Gender", selection: $viewState.gender) {
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
            RefreshableContentView(isRefreshing: $viewState.isLoading) {
                content
            }
        }
        .coordinateSpace(name: RefreshablePresentModel.homeScrollView)
        .refreshable {
            Task {
                self.viewState.page += 1
                if !viewState.filterDictionary.isEmpty {
                    viewState.gender = nil
                    viewState.status = nil
                    viewState.searchText = ""
                } else {
                    try await characterService.fetchAll(page: viewState.page)
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
