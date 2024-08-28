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

    let fiveDigitsNumberValidator = RegexValidator.fiveDigitsNumber
    let ibanValidator = RegexValidator.iban
    let phoneNumberValidator = RegexValidator.phone

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Buttons")
                    .font(.title)
                Divider()

                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(text: $nameSurname, placeholderText: "Enter your name surname"),
                    appearanceModifier: PillFieldAppearanceModifier(type: .custom(sfSymbolName: "person.3"), themeStyle: .ocean)
                ).build()
                
                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(text: $addressText, placeholderText: "Enter your address"),
                    appearanceModifier: PillFieldAppearanceModifier(type: .custom(sfSymbolName: "location.circle"), themeStyle: .ocean)
                ).build()

               
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    FacetedBuilderView()
}
