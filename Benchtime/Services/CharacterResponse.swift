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
    let next: String
    let prev: String?
}

// MARK: - Result
struct Figure: Codable, Identifiable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
