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

    func getAll(page: Int, name: String, status: CharacterStatus?, gender: CharacterGender?) -> URL? {
        var urlString = "\(url)/?page=\(page)"
        if !name.trimmingCharacters(in: .whitespaces).isEmpty {
            urlString += "&name=\(name)"
        }
        if let status = status {
            urlString += "&status=\(status.rawValue)"
        }
        if let gender = gender {
            urlString += "&gender=\(gender.rawValue)"
        }
        return URL(string: urlString)
    }
}
