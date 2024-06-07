//
//  APIConfig.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Foundation

struct RickAndMorty {
    enum ApiConfig {
        private static let baseURL: String = "https://rickandmortyapi.com/api/"
        case characters
        case locations
        case episodes
        
        var url: String {
            switch self {
            case .characters:
                return "\(Self.baseURL)character"
            case .locations:
                return "\(Self.baseURL)location"
            case .episodes:
                return "\(Self.baseURL)episode"
            }
        }
        
        static func getCharacters(by criteria: [CharacterFilterCriteria], page: Int?) -> URL? {
            let helper = CharacterHelper()
            if criteria.isEmpty {
                return URL(string: helper.makeUrlString(with: [], page: page))
            } else {
                return URL(string: helper.makeUrlString(with: criteria))
            }
        }
    }
}

extension RickAndMorty.ApiConfig {
    func get(by id: String) -> URL? {
        switch self {
        case .characters, .episodes:
            return URL(string: "\(url)/\(id)")
        default: return nil // Not implemented yet
        }
    }
}
