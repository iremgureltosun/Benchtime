//
//  AnimalCell.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

struct AnimalCell: View {
    let appearance: Appearance

    init(_ appearance: Appearance) {
        self.appearance = appearance
    }

    var body: some View {
        VStack {
            appearance.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80, alignment: .top)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(appearance.background, lineWidth: 2) // Add a stroked circle
                )
        }
    }
}
