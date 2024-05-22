//
//  APIConfig.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Foundation

enum ApiConfig {
    private static let baseURL: String = "https://rickandmortyapi.com/api/"
    case characters
    case locations
    case episodes

    private var url: String {
        switch self {
        case .characters:
            return "\(Self.baseURL)character"
        case .locations:
            return "\(Self.baseURL)location"
        case .episodes:
            return "\(Self.baseURL)episode"
        }
    }

    static func getCharacters(by criteria: CharacterFilterCriteria) -> URL? {
        var urlString = "\(ApiConfig.characters.url)"
        
        switch criteria {
        case let .none(page):
            urlString = "\(urlString)/?page=\(page)"
        case let .name(text):
            if !text.trimmingCharacters(in: .whitespaces).isEmpty {
                urlString = "\(urlString)?name=\(text)"
            }
        case .gender, .status:
            // TO DO
            print("Not implemented yet")
        }
        return URL(string: urlString)
    }

    func get(by id: String) -> URL? {
        switch self {
        case .characters:
            return URL(string: "\(url)/\(id)")
        default: return nil // Not implemented yet
        }
    }
}
