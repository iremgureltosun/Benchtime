//
//  CharacterService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Foundation
import Observation

protocol CharacterService {
    var figureList: [Figure] { get }
    func fetchAll(page: Int) async throws
    func fetchWithCriteria(criteria: [CharacterFilterCriteria]) async throws
}

@Observable final class CharacterServiceImpl: CoreNetworkService<CharacterResponse>, CharacterService {
    private(set) var figureList: [Figure] = []

    private func search(by criteria: [CharacterFilterCriteria], page: Int? = nil) async throws -> [Figure] {
        guard let charactersUrl = RickAndMorty.Endpoint.getCharacters(by: criteria, page: page) else {
            throw HTTPError.invalidRequest
        }
        
        // Building the url request with builder pattern
        let apiRequest = APIRequestBuilderImpl<Data>(charactersUrl)
            .setMethod(.get)
            .build()
        
        guard let urlRequest = apiRequest.getURLRequest() else {
            throw HTTPError.invalidRequest
        }
        
        return try await callAPI(urlRequest).results
    }

    func fetchAll(page: Int) async throws {
        figureList.removeAll() // Cleaned if filter is applied before
        for i in 1 ... page {
            let list = try await search(by: [], page: i)
            figureList.insert(contentsOf: list, at: 0)
        }
    }

    func fetchWithCriteria(criteria: [CharacterFilterCriteria]) async throws {
        figureList = try await search(by: criteria)
    }
}
