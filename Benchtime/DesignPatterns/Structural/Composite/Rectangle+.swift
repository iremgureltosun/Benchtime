//
//  Rectangle+.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import SwiftUI

extension Rectangle: Component {
    func applyTheme(_ theme: Theme) -> some View {
        foregroundColor(theme.colorCatalog.highlightedColor)
    }
}

extension RoundedRectangle: Component {
    func applyTheme(_ theme: Theme) -> some View {
        foregroundColor(theme.colorCatalog.highlightedColor)
    }
}
