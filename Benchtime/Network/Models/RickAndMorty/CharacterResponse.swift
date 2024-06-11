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
