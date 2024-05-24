//
//  Color+.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.05.2024.
//

import Foundation
import SwiftUI

extension Color {
    var hex: String {
        let uiColor = UIColor(self)
        guard let components = uiColor.cgColor.components, components.count >= 3 else {
            return "#000000" // Default to black if unable to get components
        }

        let red = Int(components[0] * 255.0)
        let green = Int(components[1] * 255.0)
        let blue = Int(components[2] * 255.0)

        return String(format: "#%02X%02X%02X", red, green, blue)
    }
}
