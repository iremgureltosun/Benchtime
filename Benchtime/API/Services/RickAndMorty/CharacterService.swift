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
    func search(by criteria: [CharacterFilterCriteria], page: Int?) throws -> AnyPublisher<CharacterResponse, Error>
}

@available(iOS 13.0, *)
final class CharacterServiceImpl: CoreNetworkService<CharacterResponse>, CharacterService {
    func search(by criteria: [CharacterFilterCriteria], page: Int? = nil) throws -> AnyPublisher<CharacterResponse, Error> {
        guard let charactersUrl = RickAndMorty.ApiConfig.getCharacters(by: criteria, page: page) else {
            throw HTTPError.invalidRequest
        }
        return try performRequest(urlRequest: URLRequest(url: charactersUrl))
    }
}

extension CharacterService {
    // Default implementation where page is nil
    func search(by criteria: [CharacterFilterCriteria]) throws -> AnyPublisher<CharacterResponse, Error> {
        return try search(by: criteria, page: nil)
    }
}
