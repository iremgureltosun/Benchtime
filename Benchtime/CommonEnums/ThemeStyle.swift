//
//  ThemeStyle.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import SwiftUI

struct ColorCatalog {
    let backgroundColor: Color
    let textColor: Color
    let highlightedColor: Color
}

enum ThemeStyle: Theme {
    case ocean
    case desert

    var colorCatalog: ColorCatalog {
        switch self {
        case .ocean:
            return .init(backgroundColor: .blue, textColor: .secondary, highlightedColor: .green)
        case .desert:
            return .init(backgroundColor: .orange, textColor: .black, highlightedColor: .red)
        }
    }
}
