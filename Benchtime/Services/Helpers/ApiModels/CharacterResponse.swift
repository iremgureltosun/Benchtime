//
//  CartoonResponse.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Network

struct CharacterResponse: HTTPResponseProtocol {
    typealias HTTPEntityType = CharacterResponse.Type

    let info: Info
    let results: [Figure]
}

// MARK: - Info

struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

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

    enum CodingKeys: String, CodingKey {
        case id
        case name //= "namexxx"
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


