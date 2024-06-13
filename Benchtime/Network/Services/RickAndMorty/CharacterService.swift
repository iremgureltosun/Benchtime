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
        guard let charactersUrl = RickAndMorty.ApiConfig.getCharacters(by: criteria, page: page) else {
            throw HTTPError.invalidRequest
        }
        return try await callAPI(URLRequest(url: charactersUrl)).results
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
