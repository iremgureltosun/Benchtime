//
//  CharacterHelper.swift
//  Benchtime
//
//  Created by Tosun, Irem on 29.05.2024.
//

import Foundation

struct CharacterHelper {
    func makeUrlString(with criteria: [CharacterFilterCriteria], page: Int? = nil) -> String {
        var parameterDict: [String: String] = [:]
        var urlString = "\(RickAndMorty.ApiConfig.characters.url)/?"

        guard !criteria.isEmpty else{
            return makeUrlString(page: page ?? 1)
        }
        for filter in criteria {
            switch filter {
            case let .name(name):
                parameterDict["name"] = name
            case let .gender(gender):
                parameterDict["gender"] = gender.rawValue
            case let .status(status):
                parameterDict["status"] = status.rawValue
            }
        }
        for (key, value) in parameterDict {
            if value != "" {
                urlString.append(key + "=" + value + "&")
            }
        }
        urlString.removeLast() // Removed last &

        return urlString
    }

    private func makeUrlString(page: Int) -> String {
        "\(RickAndMorty.ApiConfig.characters.url)/?page=\(page)"
    }
}
       
