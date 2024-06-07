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
    let episode: [String]
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

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        status = try container.decode(CharacterStatus.self, forKey: .status)
        species = try container.decode(String.self, forKey: .species)
        type = try container.decode(String.self, forKey: .type)
        gender = try container.decode(CharacterGender.self, forKey: .gender)
        origin = try container.decode(Location.self, forKey: .origin)
        location = try container.decode(Location.self, forKey: .location)
        image = try container.decode(String.self, forKey: .image)
        episode = try container.decodeIfPresent([String].self, forKey: .episode) ?? []
        url = try container.decode(String.self, forKey: .url)
        created = try container.decode(String.self, forKey: .created)
        hobbyList = try container.decodeIfPresent([Hobby].self, forKey: .hobbyList)
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

