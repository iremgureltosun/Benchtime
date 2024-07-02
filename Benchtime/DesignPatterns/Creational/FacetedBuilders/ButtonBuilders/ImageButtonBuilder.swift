//
//  ImageButtonBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import SwiftUI

struct ImageButtonStyleBuilder {
    var themeStyle: ThemeStyle
    var imageName: String
    var action: () -> Void
    
    func build() -> some View {
        Button(action: action) {
            Image(systemName: imageName)
                .foregroundColor(themeStyle.colorCatalog.textColor)
                .padding()
                .background(themeStyle.colorCatalog.backgroundColor)
                .cornerRadius(10)
        }
    }
}
