//
//  EpisodeService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.05.2024.
//

import Foundation

protocol EpisodeService {
    func getMultiple(by list: [String]) async throws -> [Episode]
    func get(by id: String) async throws -> Episode
}

final class EpisodeServiceImpl: CoreNetworkService<Episode>, EpisodeService {
    func getMultiple(by list: [String]) async throws -> [Episode] {
        guard let url = RickAndMorty.Endpoint.episodes.getMultiple(by: list) else {
            throw HTTPError.invalidRequest
        }
        return try await callAPI(URLRequest(url: url))
    }
    
    func get(by id: String) async throws -> Episode {
        guard let episodeUrl = RickAndMorty.Endpoint.episodes.get(by: id) else {
            throw HTTPError.invalidRequest
        }
        return try await callAPI(URLRequest(url: episodeUrl))
    }
}
