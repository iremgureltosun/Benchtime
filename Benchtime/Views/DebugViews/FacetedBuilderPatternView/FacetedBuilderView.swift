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

    let field1 = FieldValidator(validator: .fiveDigitsNumber, "")
    let fieldIban = FieldValidator(validator: .iban, "")
    let fieldPhone = FieldValidator(validator: .phone, "")

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Buttons")
                    .font(.title)
                Divider()

                buttonsGenerated

                Text("Text Fields")
                    .font(.title)

                Divider()

                textFieldsGenerated

                Text("Pill Fields")
                    .font(.title)

                Divider()

                PillFieldBuilder(text: $addressText, placeholderText: "Enter your address", type: .custom(sfSymbolName: "location.circle"), themeStyle: .ocean, buttonHandler: {})
                    .build()

                PillFieldBuilder(text: $addressText, placeholderText: "Search", type: .custom(sfSymbolName: "location.circle.fill"), themeStyle: .desert, buttonHandler: {})
                    .build()

                ValidatingPillFieldBuilder(field: field1, placeholderText: "Enter a number with max 5 digits", type: .rightArrow, themeStyle: .ocean)
                    .build()

                ValidatingPillFieldBuilder(field: fieldIban, placeholderText: "TR33 0006 1005 1978 6457 8413 26", type: .custom(sfSymbolName: "chevron.right.circle.fill"), themeStyle: .desert)
                    .buildWithSubmissionValidation()

                ValidatingPillFieldBuilder(field: fieldPhone, placeholderText: "111 222 3333 or 111-222-3333", type: .custom(sfSymbolName: "phone.circle"), themeStyle: .ocean)
                    .buildWithSubmissionValidation()
            }
            .padding(.horizontal, Constants.Spaces.mediumSpace)
        }
    }

    @ViewBuilder private var buttonsGenerated: some View {
        Group {
            HStack {
                CustomButtonBuilder(themeStyle: .ocean, buttonTitle: "Testing the pattern") {
                    print("do nothing for now")
                }
                .build()
                .frame(width: 150)

                CustomButtonBuilder(themeStyle: .desert, buttonTitle: "Testing the pattern") {
                    print("do nothing for now")
                }
                .build()
                .frame(width: 150)
            }

        }.frame(height: 50)

        HStack {
            ImageButtonStyleBuilder(themeStyle: .ocean, imageName: "plus", action: {
                print("do nothing for now")
            })
            .build()

            ImageButtonStyleBuilder(themeStyle: .ocean, imageName: "minus", action: {
                print("do nothing for now")
            })
            .build()

            ImageButtonStyleBuilder(themeStyle: .desert, imageName: "plus", action: {
                print("do nothing for now")
            })
            .build()

            ImageButtonStyleBuilder(themeStyle: .desert, imageName: "minus", action: {
                print("do nothing for now")
            })
            .build()
        }
    }

    @ViewBuilder private var textFieldsGenerated: some View {
        PlainTextFieldBuilder(placeholder: "Name surname", text: $nameSurname)
            .build()

        SecureTextFieldBuilder(placeholder: "Password", text: $password)
            .build()

        NumericTextFieldBuilder(placeholder: "Height", value: $height)
            .build()
    }
}

#Preview {
    FacetedBuilderView()
}
