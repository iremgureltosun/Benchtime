//
//  PillField.swift
//  Benchtime
//
//  Created by Tosun, Irem on 25.06.2024.
//

import SwiftUI

struct PillField: View {
    @Binding private var text: String
    private let placeholderText: String
    private let type: PillFieldIconsType
    private let themeStyle: ThemeStyle
    var buttonHandler: () -> Void

    init(text: Binding<String>, placeholderText: String, type: PillFieldIconsType, themeStyle: ThemeStyle, buttonHandler: @escaping () -> Void) {
        _text = text
        self.placeholderText = placeholderText
        self.type = type
        self.themeStyle = themeStyle
        self.buttonHandler = buttonHandler
    }

    var body: some View {
        TextField(placeholderText, text: $text, onCommit: {
            buttonHandler()
        })
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .overlay(
            HStack {
                Spacer()
                Image(systemName: "plus.square")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(themeStyle.colorCatalog.backgroundColor)
                    .padding(.trailing, 10)
                    .onTapGesture {
                        buttonHandler()
                    }
            }
        )
    }
}

