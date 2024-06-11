//
//  EpisodesView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.05.2024.
//

import SwiftUI

struct EpisodesView: View {
    @Environment(\.sizeCategory) var sizeCategory
    let episode: Episode

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(style: StrokeStyle())
            .foregroundColor(.purple)
            .frame(width: 300, height: sizeCategory.sectionHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.orange)
                    .overlay(
                        VStack {
                            Text(episode.name)
                                .font(.body)
                                .foregroundColor(.blue)
                                .multilineTextAlignment(.center)

                            Text(episode.airDate)
                                .font(sizeCategory < ConstantSizeCategory.limit ? .subheadline : .system(size: 30))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)

                            Text("Episode: \(episode.episode)")
                                .font(sizeCategory < ConstantSizeCategory.limit ? .footnote : .system(size: 20))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal, 10)
                    )
            )
    }
}

private extension ContentSizeCategory {
    var sectionHeight: CGFloat {
        switch self {
        case .extraSmall: return 90
        case .small: return 110
        case .accessibilityMedium: return 180
        case .accessibilityLarge: return 200
        case .accessibilityExtraLarge: return 220
        case .accessibilityExtraExtraLarge: return 320
        case .accessibilityExtraExtraExtraLarge: return 400
        default: return 120
        }
    }
}

struct EpisodePreview: PreviewProvider {
    static var previews: some View {
        let episode = Episode(id: 0, name: "The Ricklantis Mixup", airDate: "September 10, 2017", episode: "S03E07", characters: [], url: "https://rickandmortyapi.com/api/episode/28", created: "2017-11-10T12:56:36.618Z")
        return EpisodesView(episode: episode)
    }
}
