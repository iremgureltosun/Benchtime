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
    private (set) var figureList: [Figure] = []
    
    private func search(by criteria: [CharacterFilterCriteria], page: Int? = nil) async throws -> [Figure] {
        guard let charactersUrl = RickAndMorty.ApiConfig.getCharacters(by: criteria, page: page) else {
            throw HTTPError.invalidRequest
        }
        return try await callAPI(URLRequest(url: charactersUrl)).results
    }
    
    func fetchAll(page: Int) async throws {
        let list = try await search(by: [], page: page)
        let existingFigures = Set(figureList)
        let newFigures = list.filter { !existingFigures.contains($0) }
        figureList.insert(contentsOf: newFigures, at: 0)
    }
    
    func fetchWithCriteria(criteria: [CharacterFilterCriteria]) async throws {
        self.figureList.removeAll()
        self.figureList = try await search(by: criteria)
    }
}