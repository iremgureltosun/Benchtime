//
//  MediumCharacterDetailView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 28.05.2024.
//

import SwiftUI

struct MediumCharacterDetailView: View {
    var viewState: CharacterDetailsViewState
    
    init(_ viewState: CharacterDetailsViewState) {
        self.viewState = viewState
    }

    var body: some View {
        if let figure = viewState.characterDetails {
            HStack {
                RemoteImageView(url: figure.image, contentMode: .fit)
                    .frame(width: 120, height: 120, alignment: .top)
                    .clipShape(Circle())

                VStack(alignment: .trailing, spacing: 15) {
                    ProfileTitleRowView(figure: figure)

                    ProfileRowView(icon: Image(systemName: "house"), title: "Hometown", field: figure.origin.name)

                    ProfileRowView(title: "Species", field: figure.species)

                    ProfileRowView(title: "Last known location", field: figure.location.name)
                }
            }
        }
        RoundedRectangle(cornerRadius: 20)
            .ignoresSafeArea()
            .foregroundColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/ .opacity(0.3))
            .overlay {
                VStack {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 13) {
                            ForEach(viewState.episodes, id: \.self) { episode in
                                EpisodesView(episode: episode)
                            }
                        }
                    }
                }
                .padding()
            }
    }
}
