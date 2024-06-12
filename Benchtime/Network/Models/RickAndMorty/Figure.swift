//
//  Figure.swift
//  Benchtime
//
//  Created by Tosun, Irem on 7.06.2024.
//

import Foundation
import Network

// MARK: - Result

struct Figure: HTTPResponseProtocol {
    typealias HTTPEntityType = Figure.Type

    let id: Int
    var name: String
    let status: CharacterStatus
    let species, type: String
    let gender: CharacterGender
    let origin, location: Location
    let image: String
    let episode: [String]?
    let url: String
    let created: String
    let hobbyList: [Hobby]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
        case hobbyList
    }
}

extension Figure: Hashable {
    static func == (lhs: Figure, rhs: Figure) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

