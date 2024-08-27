//
//  FacetedBuilderView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import SwiftUI

struct FacetedBuilderView: View {
    @State private var nameSurname: String = ""
    @State private var password: String = ""
    @State private var height: Int = 0
    @State private var addressText: String = ""

    let fiveDigitsNumberValidator = FieldValidator(validator: .fiveDigitsNumber, errorMessage: "Enter up to 5 digits")
    let ibanValidator = FieldValidator(validator: .iban, errorMessage: "Invalid IBAN format")
    let phoneNumberValidator = FieldValidator(validator: .phone, errorMessage: "Invalid phone number")

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Buttons")
                    .font(.title)
                Divider()

                // Example Pill Field without Validation
                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(text: $addressText, placeholderText: "Enter your address"),
                    appearanceBuilder: PillFieldAppearanceBuilder(type: .custom(sfSymbolName: "location.circle"), themeStyle: .ocean)
                ).build()

                // Example Pill Field with Validation
                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(text: $addressText, placeholderText: "Enter a number with max 5 digits"),
                    appearanceBuilder: PillFieldAppearanceBuilder(type: .rightArrow, themeStyle: .ocean),
                    validationBuilder: PillFieldValidationBuilder(validator: fiveDigitsNumberValidator, placeholderText: "Enter a number")
                ).build()
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    FacetedBuilderView()
}
