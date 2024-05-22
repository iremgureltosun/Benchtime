//
//  CharacterDetailView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import SwiftUI
import Resolver

struct CharacterDetailView: View {
    @State private var viewModel: CharacterDetailViewModel
    @Injected private var service: CharacterDetailService
    
    init(id: String) {
        viewModel = .init(id: id)
    }

    var body: some View {
        VStack {
            if let figure = viewModel.characterDetails {
                RemoteImageView(url: figure.image, contentMode: .fit)
            }
        }
        .onAppear {
            viewModel.setup(service: service)
            viewModel.getCharacter()
        }
    }
}

#Preview {
    CharacterDetailView(id: "2")
}
