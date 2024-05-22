//
//  CharacterService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Combine
import Foundation
import Network

@available(iOS 13.0, *)
protocol CharacterService {
    func search(by criteria: CharacterFilterCriteria) throws -> AnyPublisher<CharacterResponse, Error>
}

@available(iOS 13.0, *)
final class CharacterServiceImpl: CoreNetworkService<CharacterResponse>, CharacterService {
    func search(by criteria: CharacterFilterCriteria) throws -> AnyPublisher<CharacterResponse, Error> {
        guard let charactersUrl = ApiConfig.getCharacters(by: criteria) else {
            throw HTTPError.invalidRequest
        }
        return try performRequest(urlRequest: URLRequest(url: charactersUrl))
    }
}

enum CharacterFilterCriteria {
    case name(text: String)
    case gender
    case status
    case none(page: Int)
}
