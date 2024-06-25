//
//  PillFieldBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 25.06.2024.
//

import SwiftUI

struct PillFieldBuilder {
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
    
    func build() -> some View {
        PillField(text: $text, placeholderText: placeholderText, type: type, themeStyle: themeStyle)
    }
}
