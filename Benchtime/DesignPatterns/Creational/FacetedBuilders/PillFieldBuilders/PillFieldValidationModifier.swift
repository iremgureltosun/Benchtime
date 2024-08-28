//
//  PillFieldValidationBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.08.2024.
//

import SwiftUI

struct PillFieldValidationModifier: ViewModifier {
    private var validator: RegexValidator
    @Binding private var value: String
    
    init(validator: RegexValidator, value: Binding<String>) {
        self.validator = validator
        _value = value
    }
    
    func body(content: Content) -> some View {
        content
            .onChange(of: value, initial: false) { oldValue, newValue in
                           if !validator.validate(newValue) {
                               value = oldValue
                           }
            }
    }
}
