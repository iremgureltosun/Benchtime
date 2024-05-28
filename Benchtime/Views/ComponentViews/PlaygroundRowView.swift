//
//  PlaygroundRowView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 23.05.2024.
//

import SwiftUI

struct PlaygroundRowView: View {
    private let resultText: String
    private let staticLabel: String
    private let showMarker: Bool
    
    init(for resultText: String, _ staticLabel: String, showMarker: Bool = false) {
        self.resultText = resultText
        self.staticLabel = staticLabel
        self.showMarker = showMarker
    }

    var body: some View {
        HStack {
            if showMarker {
                Image(systemName: "circle.fill")
            }

            Text(staticLabel)
                .font(.headline)

            Spacer()

            Text(resultText)
        }
    }
}

#Preview {
    PlaygroundRowView(for: "45555.9", "Result", showMarker: true)
}
