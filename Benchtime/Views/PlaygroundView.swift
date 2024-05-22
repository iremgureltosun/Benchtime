//
//  PlaygroundView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import SwiftUI

struct PlaygroundView: View {
    @State private var viewModel: PlaygroundViewModel = .init()

    var body: some View {
        VStack {
            Text("Name: \(viewModel.person.name)")
            
            Button {
                viewModel.printPerson()
            } label: {
                Text("Print name")
            }
        }
    }
}

#Preview {
    PlaygroundView()
}
