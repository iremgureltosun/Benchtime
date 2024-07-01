//
//  CustomButtonBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import SwiftUI

struct CustomButtonBuilder {
    var themeStyle: ThemeStyle
    var buttonTitle: String
    var action: () -> Void

    func build() -> some View {
        CustomButton(buttonTitle: buttonTitle, themeStyle: themeStyle, actionHandler: action)
    }
}
