//
//  CharactersView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Combine
import Resolver
import SwiftUI

struct CharacterListView: View {
    // MARK: View related storables

    let listItems: [GridItem] = Array(repeating: .init(.fixed(CGFloat(100))), count: 3)

    @State var viewModel = CharacterListViewModel()
    @Injected var service: CharacterService
    @Environment(\.appManager) private var applicationManager

    var body: some View {
        VStack {
            header

            filteringRow
                .padding(.horizontal, 40)
                .padding(.top, -40)

            scrollableContent
        }
        .ignoresSafeArea(edges: [.top])
        .onAppear {
            viewModel.setup(with: service)
            try? viewModel.fetchAll()
        }
    }

    @ViewBuilder private var header: some View {
        HeaderView(themeStyle: .desert, title: "Rick and Morty", subtitle: "Characters")
    }

    @ViewBuilder private var content: some View {
        LazyVGrid(columns: listItems, spacing: 20) {
            ForEach(Array(viewModel.figureList.enumerated()), id: \.element.id) { _, figure in
                getCell(for: figure)
            }
        }
    }

    @ViewBuilder private func getCell(for figure: Figure) -> some View {
        VStack {
            RemoteImageView(url: figure.image, contentMode: .fit)

            HStack {
                Group {
                    Text(figure.species)

                    Spacer()

                    Text(figure.name)
                }
                .lineLimit(2, reservesSpace: true)
                .font(.caption2)
            }
        }
        .onTapGesture {
            applicationManager.navigate(to: .characterDetail(id: String(figure.id)))
        }
    }

    @ViewBuilder private var filteringRow: some View {
        VStack(alignment: .trailing, content: {
            SearchTextfield(searchText: $viewModel.searchText)

            Text("\(viewModel.recordCount) records")
                .font(.caption)
        })
        .onChange(of: viewModel.searchText, initial: false, { _, _ in
            Task {
                await viewModel.onSearchTextChanged()
            }
        })
    }

    @ViewBuilder private var scrollableContent: some View {
        ScrollView(showsIndicators: false) {
            RefreshableContentView(isRefreshing: $viewModel.isLoading) {
                content
            }
        }
        .coordinateSpace(name: RefreshablePresentModel.homeScrollView)
        .refreshable {
            viewModel.page += 1
            try? viewModel.fetchAll()
        }
        .onAppear {
            UIRefreshControl.appearance().tintColor = .clear
        }
    }
}

#Preview {
    CharacterListView()
}
