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
    private let type: PillFieldType
    private let themeStyle: ThemeStyle
    var buttonHandler: () -> Void

    init(text: Binding<String>, placeholderText: String, type: PillFieldType, themeStyle: ThemeStyle, buttonHandler: @escaping () -> Void) {
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
                type.image
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

#Preview {
    PillField(text: .constant(""), placeholderText: "Search", type: .searchIcon, themeStyle: .ocean, buttonHandler: {})
}
