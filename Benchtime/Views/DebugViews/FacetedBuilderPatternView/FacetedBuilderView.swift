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
    @State private var height: Double = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("Buttons")
                .font(.title)
            Divider()

            buttonsGenerated

            Text("Text Fields")
                .font(.title)

            Divider()

            textFieldsGenerated
        }
        .padding(.horizontal, Constants.Spaces.mediumSpace)
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
            VStack {
                ImageButtonStyleBuilder(themeStyle: .ocean, imageName: "plus", action: {
                    print("do nothing for now")
                })
                .build()

                ImageButtonStyleBuilder(themeStyle: .ocean, imageName: "minus", action: {
                    print("do nothing for now")
                })
                .build()
            }
            VStack {
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
