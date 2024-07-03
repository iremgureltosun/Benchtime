//
//  Appearence.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

struct Appearance: Equatable {
    let image: Image
    var background: Color = .clear

    mutating func setColor(_ color: Color) {
        background = color
    }
}
