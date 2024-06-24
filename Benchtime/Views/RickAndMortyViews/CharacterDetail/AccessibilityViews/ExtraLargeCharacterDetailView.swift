//
//  ExtraLargeCharacterDetailsView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 28.05.2024.
//

import SwiftUI

struct ExtraLargeCharacterDetailView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @State private var selectedTab = 1
    @State private var selectedEpisode = 0
    var viewState: CharacterDetailsViewState

    init(_ viewState: CharacterDetailsViewState) {
        self.viewState = viewState
    }

    var body: some View {
        if let figure = viewState.characterDetails {
            TabView(selection: $selectedTab) {
                Group {
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
                }.padding(.bottom, 20)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }

        if viewState.episodes.count > 0 {
            TabView(selection: $selectedEpisode) {
                ForEach(Array(viewState.episodes.enumerated()), id: \.1.id) { index, episode in
                    EpisodesView(episode: episode)
                        .tag(index)
                }
            }
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.orange)) // Apply background with corner radius
            .clipShape(RoundedRectangle(cornerRadius: 20)) // Clip the shape
            .ignoresSafeArea()
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }

    @ViewBuilder private func getTab1(for figure: Figure) -> some View {
        VStack(spacing: 0) {
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
