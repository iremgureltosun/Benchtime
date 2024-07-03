//
//  CharacterStyleFactory.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

final class CharacterStyleFactory {
    private var styles: Set<CharacterStyle> = []

    func getStyle(font: Font, color: Color, size: CGFloat) -> CharacterStyle {
        let style = CharacterStyle(font: font, color: color, size: size)
        if let existingStyle = styles.first(where: { $0 == style }) {
            return existingStyle
        } else {
            styles.insert(style)
            return style
        }
    }
}
