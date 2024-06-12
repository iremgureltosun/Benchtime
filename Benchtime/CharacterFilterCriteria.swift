//
//  CharacterFilterCriteria.swift
//  Benchtime
//
//  Created by Tosun, Irem on 29.05.2024.
//

import Foundation

enum CharacterFilterCriteria {
    case name(text: String)
    case gender(gender: CharacterGender)
    case status(status: CharacterStatus)
}
enum FilterKey {
    case name
    case gender
    case status
}
