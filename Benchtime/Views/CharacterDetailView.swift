//
//  CharacterDetailView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import Resolver
import SwiftUI

struct CharacterDetailView: View {
    @State private var viewModel: CharacterDetailViewModel
    @Injected private var characterService: CharacterDetailService
    @Injected private var episodeService: EpisodeService

    init(id: String) {
        viewModel = .init(id: id)
    }

    var body: some View {
        VStack {
            if let figure = viewModel.characterDetails {
                RemoteImageView(url: figure.image, contentMode: .fit)
                    .frame(width: 180, height: 180, alignment: .top)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 15) {
                    profileRow(status: figure.status, figure.gender.genderIconName, field: figure.name)

                    profileRow(Image(systemName: "house"), title: "Hometown:", field: figure.origin.name)

                    profileRow(title: "Species:", field: figure.species)

                    profileRow(title: "Last known location:", field: figure.location.name)
                }
            }
            RoundedRectangle(cornerRadius: 20)
                .ignoresSafeArea()
                .foregroundColor(.gray).opacity(0.1)
                .overlay {
                    VStack {
                        AnimatedTextView(title: "EPISODES")

                        ScrollView(showsIndicators: false) {
                            VStack {
                                ForEach(viewModel.episodes, id: \.self) { episode in
                                    EpisodesView(episode: episode)
                                }
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
        }
        .onAppear {
            viewModel.setup(characterService: characterService, episodeService: episodeService)
            viewModel.getCharacter()
        }
    }

    @ViewBuilder private func profileRow(_ icon: Image? = nil, title: String, field: String) -> some View {
        HStack {
            Spacer()

            if let icon = icon {
                icon
                    .foregroundColor(.black)
            }
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)

            Text(field)
                .foregroundColor(.gray)
            Spacer()
        }
    }

    @ViewBuilder private func profileRow(status: CharacterStatus, _ text: String, field: String) -> some View {
        HStack {
            Spacer()

            Image(systemName: "circle.fill")
                .foregroundColor(status.color)
                .font(.caption2)

            Text(text)
                .font(.title2)
                .foregroundColor(.gray)

            Text(field)

            Spacer()
        }
    }
}

#Preview {
    CharacterDetailView(id: "2")
}
