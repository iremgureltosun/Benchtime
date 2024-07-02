//
//  Text.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import SwiftUI

extension Text: Component {
    func applyTheme(_ theme: Theme) -> some View {
        foregroundColor(theme.colorCatalog.textColor)
    }
}
