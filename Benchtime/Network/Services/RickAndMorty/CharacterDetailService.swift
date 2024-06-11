//
//  CharacterDetailService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import Foundation

protocol CharacterDetailService {
    func get(by id: String) async throws -> Figure
}

final class CharacterDetailServiceImpl: CoreNetworkService<Figure>, CharacterDetailService {
    func get(by id: String) async throws -> Figure {
        guard let charactersUrl = RickAndMorty.ApiConfig.characters.get(by: id) else {
            throw HTTPError.invalidRequest
        }
        return try await callAPI(URLRequest(url: charactersUrl))
    }
}
