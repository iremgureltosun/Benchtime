//
//  List+.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import SwiftUI

extension List: Component {
    func applyTheme(_ theme: Theme) -> some View {
        tint(theme.colorCatalog.highlightedColor)
    }
}

extension ListCell: Component {
    func applyTheme(_ theme: Theme) -> some View {
        listRowBackground(theme.colorCatalog.backgroundColor)
    }
}


