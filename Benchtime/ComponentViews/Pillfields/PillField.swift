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

    init(text: Binding<String>, placeholderText: String, type: PillFieldType, themeStyle: ThemeStyle) {
        _text = text
        self.placeholderText = placeholderText
        self.type = type
        self.themeStyle = themeStyle
    }

    var body: some View {
        TextField(placeholderText, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .overlay(
                HStack {
                    Spacer()
                    type.image
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(themeStyle.colorPair.backgroundColor)
                        .padding(.trailing, 10)
                }
            )
    }
}

#Preview {
    PillField(text: .constant(""), placeholderText: "Search", type: .searchIcon, themeStyle: .ocean)
}
