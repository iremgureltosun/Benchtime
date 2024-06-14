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
        guard let charactersUrl = RickAndMorty.Endpoint.characters.get(by: id) else {
            throw HTTPError.invalidRequest
        }
        
        // Building the url request with builder pattern
        let apiRequest = APIRequestBuilderImpl<Data>(charactersUrl)
            .setMethod(.get)
            .build()
        
        guard let urlRequest = apiRequest.getURLRequest() else {
            throw HTTPError.invalidRequest
        }
        
        return try await callAPI(urlRequest)
    }
}
