//
//  PlaygroundView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import SwiftUI

struct TitlePlaygroundView: View {
    @State private var viewModel: TitlePlaygroundViewModel = .init()

    var body: some View {
        VStack(spacing: 16) {
            Text("Debugging Playground")
                .font(.title2)
                .foregroundColor(.accentColor)

            Divider()

            SubheadlineView(title: "Input Name Fields")

            PlaygroundRowView(for: viewModel.person.name, "Name:", showMarker: true)

            PlaygroundRowView(for: viewModel.person.surname, "Surname:", showMarker: true)

            PlaygroundRowView(for: viewModel.person.gender.rawValue, "Gender:", showMarker: true)

            Spacer()

            SubheadlineView(title: "Calculated Result")

            PlaygroundRowView(for: viewModel.displayName, "Display Name:")

            Divider()

            HStack {
                Button {
                    viewModel.printPerson()
                } label: {
                    Text("Print Name")
                }
                
                Spacer()
                
                Button {
                    print("Make url button is clicked")
                } label: {
                    Text("Make url")
                }
            }
        }
        .padding(.all, 20)
    }
}

#Preview {
    TitlePlaygroundView()
}
