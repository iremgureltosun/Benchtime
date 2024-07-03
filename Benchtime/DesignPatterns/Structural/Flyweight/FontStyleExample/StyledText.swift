//
//  Text.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

struct StyledText {
    let value: String
    let style: CharacterStyle

    func display() -> Text {
        style.apply(to: Text(value))
    }
}
