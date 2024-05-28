//
//  ExtraLargeCharacterDetailsView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 28.05.2024.
//

import SwiftUI

struct ExtraLargeCharacterDetailView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @Bindable var viewModel: CharacterDetailViewModel
    @State private var selectedTab = 1
    @State private var selectedEpisode = 0

    var body: some View {
        if let figure = viewModel.characterDetails {
            TabView(selection: $selectedTab) {
                getTab1(for: figure)
                    .tag(1)
                // View 2
                getTab2(for: figure)
                    .tag(2)
                // View 3
                ProfileRowView(title: "Species", field: figure.species)
                    .tag(3)

                ProfileRowView(title: "Last known location", field: figure.location.name)
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }

        if viewModel.episodes.count > 0 {
            RoundedRectangle(cornerRadius: 20)
                .ignoresSafeArea()
                .foregroundColor(.blue.opacity(0.3))
                .overlay {
                    TabView(selection: $selectedEpisode) {
                        ForEach(Array(viewModel.episodes.enumerated()), id: \.1.id) { index, episode in
                            EpisodesView(episode: episode)
                                .tag(index)
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.orange))
                    .padding(20)
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
        }
    }

    @ViewBuilder private func getTab1(for figure: Figure) -> some View {
        VStack {
            RemoteImageView(url: figure.image, contentMode: .fit)
                .frame(width: sizeCategory.imageHeight, height: sizeCategory.imageHeight, alignment: .top)
                .clipShape(Circle())
            ProfileTitleRowView(figure: figure)
        }
    }

    @ViewBuilder private func getTab2(for figure: Figure) -> some View {
        VStack(alignment: .trailing, spacing: 15) {
            ProfileRowView(icon: Image(systemName: "house"), title: "Hometown:", field: figure.origin.name)
        }
    }
}

private extension ContentSizeCategory {
    var imageHeight: CGFloat {
        return self < ConstantSizeCategory.limit ? 120 : 200
    }
}
