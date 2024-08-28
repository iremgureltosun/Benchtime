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
    @State private var height: String = ""
    @State private var addressText: String = ""

    let fiveDigitsNumberValidator = RegexValidator.fiveDigitsNumber
    let ibanValidator = RegexValidator.iban
    let phoneNumberValidator = RegexValidator.phone

    private let personIcon = Image(systemName: "person")
    private let locationIcon = Image(systemName: "location.circle")
    private let minusIconon = Image(systemName: "minus.circle.fill")
    private let plusIcon = Image(systemName: "plus.circle.fill")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Buttons")
                    .font(.title)
                Divider()

                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(text: $nameSurname, placeholderText: "Enter your name surname"),
                    appearanceModifier: PillFieldAppearanceModifier(iconsType: .withTrailingIcon(personIcon), themeStyle: .ocean)
                ).build()
                
                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(text: $addressText, placeholderText: "Enter your address"),
                    appearanceModifier: PillFieldAppearanceModifier(iconsType: .withLeadingIcon(locationIcon), themeStyle: .desert)
                ).build()
                
                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(text: $height, placeholderText: "Enter your height"),
                    appearanceModifier: PillFieldAppearanceModifier(iconsType: .withIconsOnBothSide(leadingIcon: minusIconon, trailingIcon: plusIcon), themeStyle: .desert)
                ).build()

               
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    FacetedBuilderView()
}
