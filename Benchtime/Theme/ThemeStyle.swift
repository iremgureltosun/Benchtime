//
//  ThemeStyle.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import SwiftUI

typealias ColorPair = (backgroundColor: Color, foregroundColor: Color)

enum ThemeStyle {
    case ocean
    case desert
    
    var colorPair: ColorPair {
        switch self{
        case .ocean:
            return (.blue, .white)
        case .desert:
            return (.orange, .black)
        }
    }
    
    var degree: Double {
        switch self{
        case .ocean:
            return 15
        case .desert:
            return -15
        }
    }
}
