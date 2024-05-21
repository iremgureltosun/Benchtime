//
//  CharactersView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Resolver
import SwiftUI

struct CharactersView: View {
    @State var viewModel = CharactersViewModel()
    @Injected var service: CharacterService

    var body: some View {
        VStack {
            HeaderView(themeStyle: .desert, title: "Rick and Morty", subtitle: "Characters")

            initialRow
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

    @ViewBuilder private var content: some View {
        LazyVGrid(columns: viewModel.listItems, spacing: 20) {
            ForEach(0 ..< viewModel.figureList.count, id: \.self) { index in
                getCell(for: viewModel.figureList[index])
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
    }

    @ViewBuilder private var initialRow: some View {
        VStack(alignment: .trailing, content: {
            searchField

            counter
        })
    }

    @ViewBuilder private var searchField: some View {
        SearchTextfield(searchText: $viewModel.name)
    }

    @ViewBuilder private var counter: some View {
        Text("\(viewModel.recordCount) records")
            .font(.caption)
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
    CharactersView()
}
