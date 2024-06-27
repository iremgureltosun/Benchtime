//
//  SecureTextFieldBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import SwiftUI

struct SecureTextFieldBuilder {
    var placeholder: String
    @Binding var text: String
    
    func build() -> some View {
        SecureField(placeholder, text: $text)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}
