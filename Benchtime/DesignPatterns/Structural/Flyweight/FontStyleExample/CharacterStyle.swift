//
//  CharacterStyle.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

struct CharacterStyle: Hashable {
    let font: Font
    let color: Color
    let size: CGFloat
    
    func apply(to text: Text) -> Text {
        text.font(.system(size: size)).foregroundColor(color)
    }
}
