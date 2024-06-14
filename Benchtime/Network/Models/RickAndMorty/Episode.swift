//
//  Episode.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.05.2024.
//

import Foundation
import Network

struct Episode: HTTPResponseProtocol {
    typealias HTTPEntityType = Episode.Type

    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case name
        case id
        case episode
        case characters
        case url
        case created
    }
}

extension RickAndMorty.Endpoint {
    private func makeIdDefinition(from array: [String]) -> String? {
        guard !array.isEmpty else {
            return nil
        }
        return array.joined(separator: ",")
    }

    func getMultiple(by list: [String]) -> URL? {
        switch self {
        case .episodes:
            guard let id = makeIdDefinition(from: list) else { return nil }
            return URL(string: "\(url)/\(id)")
        default: return nil // Not implemented yet
        }
    }
}

extension Episode: Hashable {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
