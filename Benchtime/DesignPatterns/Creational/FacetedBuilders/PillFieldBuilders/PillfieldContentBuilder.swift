//
//  PillfieldContentBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.08.2024.
//

import SwiftUI

struct PillFieldContentBuilder {
    @Binding private var text: String
    private var placeholderText: String

    init(text: Binding<String>, placeholderText: String) {
        _text = text
        self.placeholderText = placeholderText
    }

    func buildContent() -> some View {
        TextField(placeholderText, text: $text)
    }
}
