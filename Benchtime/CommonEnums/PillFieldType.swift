//
//  File.swift
//  Benchtime
//
//  Created by Tosun, Irem on 25.06.2024.
//

import SwiftUI

enum PillFieldType {
    case rightArrow
    case downArrow
    case searchIcon
    case custom(sfSymbolName: String)
    
    var image: Image {
        switch self {
        case .rightArrow:
            return Image(systemName: "chevron.right.circle")
        case .downArrow:
            return Image(systemName: "chevron.down.circle")
        case .searchIcon:
            return Image(systemName: "magnifyingglass.circle")
        case .custom(let sfSymbol):
            return Image(systemName: sfSymbol)
        }
    }
}
