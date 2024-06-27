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
                .foregroundColor(themeStyle.colorPair.foregroundColor)
                .padding()
                .background(themeStyle.colorPair.backgroundColor)
                .cornerRadius(10)
        }
    }
}
