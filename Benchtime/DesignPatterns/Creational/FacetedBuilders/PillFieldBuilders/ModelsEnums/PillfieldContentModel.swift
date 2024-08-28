//
//  PillfieldContentModel.swift
//  Benchtime
//
//  Created by İrem TOSUN on 28.08.2024.
//

import Foundation

struct PillFieldContentModel {
    var text: String
    var placeholderText: String
    var isTyping: Bool
    
    init(text: String, placeholderText: String, isTyping: Bool = false) {
        self.text = text
        self.placeholderText = placeholderText
        self.isTyping = isTyping
    }
}
