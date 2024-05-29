//
//  CharacterGender.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.05.2024.
//

import Foundation

enum CharacterGender: String, Codable {
    case female = "Female", male = "Male", genderless = "Genderless", unknown = "unknown"
}

extension CharacterGender {
    var genderIconName: String {
        switch self {
        case .female: return "♀"
        case .male: return "♂"
        case .genderless: return "⚥"
        case .unknown: return "?"
        }
    }
}

