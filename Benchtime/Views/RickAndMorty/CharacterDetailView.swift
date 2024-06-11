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
    @Environment(\.detailState) var characterDetailsState: CharacterDetailsState
    let id: String
    
    init(id: String) {
        self.id = id
    }

    var body: some View {
        VStack {
            if sizeCategory < ConstantSizeCategory.limit {
                MediumCharacterDetailView(characterDetailsState)
            } else {
                ExtraLargeCharacterDetailView(characterDetailsState)
            }
        }
        .background(Color.white)
        .onAppear {
            Task {
                try await characterDetailsState.getCharacter(id: id)
            }
        }
    }
}

#Preview {
    CharacterDetailView(id: "3")
       // .environment(\.detailState, MockCharacterDetailService()) // Method 2
}
