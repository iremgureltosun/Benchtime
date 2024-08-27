//
//  PillFieldValidationBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.08.2024.
//

import Foundation

struct PillFieldValidationBuilder {
    private var validator: FieldValidator
    private var placeholderText: String

    init(validator: FieldValidator, placeholderText: String) {
        self.validator = validator
        self.placeholderText = placeholderText
    }

    func buildValidatedField() -> some View {
        VStack {
            TextField(placeholderText, text: .constant(""))
                .textFieldStyle(.roundedBorder)
            if !validator.errorMessage.isEmpty {
                Text(validator.errorMessage)
                    .foregroundColor(.red)
            }
        }
    }
}
