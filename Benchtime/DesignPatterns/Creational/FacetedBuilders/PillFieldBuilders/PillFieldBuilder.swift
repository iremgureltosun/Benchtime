//
//  PillFieldBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 25.06.2024.
//

import SwiftUI

struct PillFieldBuilder {
    private let contentBuilder: PillFieldContentBuilder
    private let appearanceModifier: PillFieldAppearanceModifier
    private let validationModifier: PillFieldValidationModifier?

    init(contentBuilder: PillFieldContentBuilder, appearanceModifier: PillFieldAppearanceModifier, validationModifier: PillFieldValidationModifier? = nil) {
        self.contentBuilder = contentBuilder
        self.appearanceModifier = appearanceModifier
        self.validationModifier = validationModifier
    }

    func build() -> some View {
        contentBuilder.buildContent()
            .modifier(appearanceModifier)
            .modifierIf(validationModifier != nil, apply: { $0.modifier(validationModifier!) })
    }
}

extension View {
    func modifierIf<Content: View>(_ condition: Bool, apply modifier: (Self) -> Content) -> some View {
        condition ? AnyView(modifier(self)) : AnyView(self)
    }
}

