//
//  CharacterService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Foundation

protocol CharacterService {
    func search(by criteria: [CharacterFilterCriteria], page: Int?) async throws -> CharacterResponse
}

final class CharacterServiceImpl: CoreNetworkService<CharacterResponse>, CharacterService {
    func search(by criteria: [CharacterFilterCriteria], page: Int? = nil) async throws -> CharacterResponse {
        guard let charactersUrl = RickAndMorty.ApiConfig.getCharacters(by: criteria, page: page) else {
            throw HTTPError.invalidRequest
        }
        return try await callAPI(URLRequest(url: charactersUrl))
    }
}

extension CharacterService {
    func search(by criteria: [CharacterFilterCriteria]) async throws -> CharacterResponse {
        return try await search(by: criteria, page: nil)
    }
}
