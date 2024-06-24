//
//  PlainTextFieldBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import SwiftUI

struct PlainTextFieldBuilder {
    var placeholder: String
    @Binding var text: String
    
    func build() -> some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}
