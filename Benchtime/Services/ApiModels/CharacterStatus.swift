//
//  CharacterStatus.swift
//  Benchtime
//
//  Created by Tosun, Irem on 21.05.2024.
//

import Foundation
import SwiftUI

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}

extension CharacterStatus {
    var color: Color {
        switch self {
        case .alive: return .green
        case .dead: return .red
        default: return .gray
        }
    }
}
