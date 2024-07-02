//
//  SubmissionValidatedPillField.swift
//  Benchtime
//
//  Created by Tosun, Irem on 25.06.2024.
//

import SwiftUI

struct SubmissionValidatedPillField: View {
    @State var field: FieldValidator
    private let placeholderText: String
    private let type: PillFieldType
    private let themeStyle: ThemeStyle
    @State var errorNotifierIsOn: Bool = false

    init(field: FieldValidator, placeholderText: String, type: PillFieldType, themeStyle: ThemeStyle) {
        self.field = field
        self.placeholderText = placeholderText
        self.type = type
        self.themeStyle = themeStyle
    }

    var body: some View {
        TextField(placeholderText, text: $field.value, onCommit: {
            validate()
        })
        .foregroundColor(errorNotifierIsOn ? .red : .primary)
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
                    .onTapGesture(perform: {
                        validate()
                    })
            }
        )
    }

    private func validate() {
        if !field.validator.validate(field.value) {
            errorNotifierIsOn = true
        } else {
            errorNotifierIsOn = false
        }
    }
}

#Preview {
    SubmissionValidatedPillField(field: FieldValidator(validator: RegexValidator(pattern: "^[0-9]{0,5}$"), ""), placeholderText: "Enter a 5 digit number", type: .searchIcon, themeStyle: .ocean)
}
