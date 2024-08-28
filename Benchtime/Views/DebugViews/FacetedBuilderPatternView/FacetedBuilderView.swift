//
//  FacetedBuilderView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import SwiftUI

struct FacetedBuilderView: View {
    let fiveDigitsNumberValidator = RegexValidator.fiveDigitsNumber
    let ibanValidator = RegexValidator.iban
    let phoneNumberValidator = RegexValidator.phone

    private let personIcon = Image(systemName: "person")
    private let locationIcon = Image(systemName: "location.circle")
    private let minusIconon = Image(systemName: "minus.circle.fill")
    private let plusIcon = Image(systemName: "plus.circle.fill")
    
    @State private var nameSurnameContentModel = PillFieldContentModel(text: "", placeholderText: "Enter your name surname")
    @State private var addressContentModel = PillFieldContentModel(text: "", placeholderText: "Enter your address")
    @State private var heightContentModel = PillFieldContentModel(text: "", placeholderText: "Enter your height")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Buttons")
                    .font(.title)
                Divider()

                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(contentModel: $nameSurnameContentModel, behaviourType: .placeholderOnTopWhenFilled),
                    appearanceModifier: PillFieldAppearanceModifier(iconsType: .withTrailingIcon(personIcon), themeStyle: .ocean)
                ).build()
                
                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(contentModel: $nameSurnameContentModel, behaviourType: .placeHolderAlwaysOnTop),
                    appearanceModifier: PillFieldAppearanceModifier(iconsType: .withTrailingIcon(personIcon), themeStyle: .ocean)
                ).build()
                
                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(contentModel: $addressContentModel),
                    appearanceModifier: PillFieldAppearanceModifier(iconsType: .withLeadingIcon(locationIcon), themeStyle: .desert)
                ).build()
                
                PillFieldBuilder(
                    contentBuilder: PillFieldContentBuilder(contentModel: $heightContentModel),
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
