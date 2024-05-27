//
//  EpisodesView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.05.2024.
//

import SwiftUI

struct EpisodesView: View {
    let episode: Episode
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(style: StrokeStyle())
            .foregroundColor(.purple)
            .frame(height: 90)
            .overlay {
                VStack {
                    Text(episode.name)
                        .font(.title3)
                        .foregroundColor(.blue)

                    Text(episode.airDate)
                        .font(.subheadline)

                    Text("Episode: \(episode.episode)")
                        .font(.caption)
                }
            }
    }
}

struct EpisodePreview: PreviewProvider {
    static var previews: some View {
        let episode = Episode(id: 0, name: "The Ricklantis Mixup", airDate: "September 10, 2017", episode: "S03E07", characters: [], url: "https://rickandmortyapi.com/api/episode/28", created: "2017-11-10T12:56:36.618Z")
        return EpisodesView(episode: episode)
    }
}
