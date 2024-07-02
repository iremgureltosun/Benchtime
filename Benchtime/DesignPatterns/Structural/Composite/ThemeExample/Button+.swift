//
//  Button+.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import SwiftUI

extension Button: Component where Label == Text {
    func applyTheme(_ theme: Theme) -> some View {
        background(theme.colorCatalog.backgroundColor)
            .foregroundColor(theme.colorCatalog.textColor)
    }
}
