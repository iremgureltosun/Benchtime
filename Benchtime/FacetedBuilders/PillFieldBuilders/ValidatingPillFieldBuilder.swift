//
//  ValidatingPillFieldBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 25.06.2024.
//

import SwiftUI

struct ValidatingPillFieldBuilder {
    private let field: FieldValidator
    private let placeholderText: String
    private let type: PillFieldType
    private let themeStyle: ThemeStyle

    init(field: FieldValidator, placeholderText: String, type: PillFieldType, themeStyle: ThemeStyle) {
        self.field = field
        self.placeholderText = placeholderText
        self.type = type
        self.themeStyle = themeStyle
    }

    func build() -> some View {
        ValidatingPillField(field: field, placeholderText: placeholderText, type: type, themeStyle: themeStyle)
    }
    
    /// Some fields need to be validated during submission because in some cases it is impossible to validate insantly
    func buildWithSubmissionValidation() -> some View {
        SubmissionValidatedPillField(field: field, placeholderText: placeholderText, type: type, themeStyle: themeStyle)
    }
}
