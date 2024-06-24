//
//  NumericTextFieldBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import SwiftUI

struct NumericTextFieldBuilder {
    var placeholder: String
    @Binding var value: Double
    
    func build() -> some View {
        TextField(placeholder, value: $value, formatter: NumberFormatter())
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}
