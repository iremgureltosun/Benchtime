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

    @State private var isLoading: Bool = false
    @State private var searchText: String = ""
    @State private var status: CharacterStatus?
    @State private var gender: CharacterGender?
    @State private var hasAppeared: Bool = false
    @State private var page: Int = 1
    @State private var filterList: [CharacterFilterCriteria] = []

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
            if !hasAppeared {
                Task {
                    try await characterService.fetchAll(page: page)
                    hasAppeared = true
                }
            }
        }
        .onChange(of: searchText, initial: false, { _, text in
            Task {
                if !text.isEmpty {
                    filterList.append(CharacterFilterCriteria.name(text: text))
                }
                guard await debouncer.sleep() else { return }
                if searchText.isEmpty, gender == nil, status == nil {
                    try await characterService.fetchAll(page: page)
                } else{
                    try await characterService.fetchWithCriteria(criteria: filterList)
                }
            }
        })
        .onChange(of: gender, initial: false, { _, gender in
            Task {
                if let gender = gender {
                    filterList.append(CharacterFilterCriteria.gender(gender: gender))
                }
                guard await debouncer.sleep() else { return }
                if searchText.isEmpty, gender == nil, status == nil {
                    try await characterService.fetchAll(page: page)
                } else{
                    try await characterService.fetchWithCriteria(criteria: filterList)
                }
            }
        })
        .onChange(of: status, initial: false, { _, status in
            Task {
                if let status = status {
                    filterList.append(CharacterFilterCriteria.status(status: status))
                }
                guard await debouncer.sleep() else { return }
                if searchText.isEmpty, gender == nil, status == nil {
                    try await characterService.fetchAll(page: page)
                } else{
                    try await characterService.fetchWithCriteria(criteria: filterList)
                }
            }
        })
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
            SearchTextfield(searchText: $searchText)

            HStack {
                Spacer()
                Text("Filter by:")
                    .font(.caption)

                Picker("Status", selection: $status) {
                    Text("status")
                        .tag(CharacterStatus?.none)

                    ForEach(statusOptions, id: \.self) { option in

                        Text(option.rawValue)
                            .tag(CharacterStatus?.some(option))
                    }
                }
                .pickerStyle(MenuPickerStyle())

                Picker("Gender", selection: $gender) {
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
            RefreshableContentView(isRefreshing: $isLoading) {
                content
            }
        }
        .coordinateSpace(name: RefreshablePresentModel.homeScrollView)
        .refreshable {
            Task {
                self.page += 1
                try await characterService.fetchAll(page: page)
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
