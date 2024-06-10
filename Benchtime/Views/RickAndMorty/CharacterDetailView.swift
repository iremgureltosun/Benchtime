//
//  CharacterDetailView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import Resolver
import SwiftUI

struct CharacterDetailView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @State private var viewModel: CharacterDetailViewModel
    @Environment(\.detailService) private var characterService: CharacterDetailService // Method 2

    // @Injected private var characterService: CharacterDetailService // Method 1
    @Injected private var episodeService: EpisodeService

    init(id: String) {
        viewModel = .init(id: id)
    }

    var body: some View {
        VStack {
            if sizeCategory < ConstantSizeCategory.limit {
                MediumCharacterDetailView(viewModel: viewModel)
            } else {
                ExtraLargeCharacterDetailView(viewModel: viewModel)
            }
        }
        .background(Color.white)
        .onAppear {
            viewModel.setup(characterService: characterService, episodeService: episodeService)
            viewModel.getCharacter()
        }
    }
}

#Preview {
    CharacterDetailView(id: "3")
        .environment(\.detailService, MockCharacterDetailService())// Method 2
}
