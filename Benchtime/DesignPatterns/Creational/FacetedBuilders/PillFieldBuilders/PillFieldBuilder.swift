//
//  PillFieldBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 25.06.2024.
//

import SwiftUI

struct PillFieldBuilder {
    private var contentBuilder: PillFieldContentBuilder
    private var appearanceBuilder: PillFieldAppearanceBuilder
    private var validationBuilder: PillFieldValidationBuilder?

    init(contentBuilder: PillFieldContentBuilder, appearanceBuilder: PillFieldAppearanceBuilder, validationBuilder: PillFieldValidationBuilder? = nil) {
        self.contentBuilder = contentBuilder
        self.appearanceBuilder = appearanceBuilder
        self.validationBuilder = validationBuilder
    }

    func build() -> some View {
        VStack(alignment: .leading) {
            contentBuilder.buildContent()
            appearanceBuilder.buildAppearance()

            if let validationBuilder = validationBuilder {
                validationBuilder.buildValidatedField()
            }
        }
        .padding()
    }
}


