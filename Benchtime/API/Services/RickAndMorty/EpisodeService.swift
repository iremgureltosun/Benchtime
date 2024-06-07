//
//  EpisodeService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.05.2024.
//

import Combine
import Foundation
import Network

@available(iOS 13.0, *)
protocol EpisodeService {
    func getMultiple(by list: [String]) throws -> AnyPublisher<[Episode], Error>
    func get(by id: String) throws -> AnyPublisher<Episode, Error>
}

@available(iOS 13.0, *)
final class EpisodeServiceImpl: CoreNetworkService<Episode>, EpisodeService {
    func getMultiple(by list: [String]) throws -> AnyPublisher<[Episode], Error> {
        guard let url = RickAndMorty.ApiConfig.episodes.getMultiple(by: list) else {
            throw HTTPError.invalidRequest
        }
        return try performRequest(urlRequest: URLRequest(url: url))
    }
    
    func get(by id: String) throws -> AnyPublisher<Episode, Error> {
        guard let episodeUrl = RickAndMorty.ApiConfig.episodes.get(by: id) else {
            throw HTTPError.invalidRequest
        }
        return try performRequest(urlRequest: URLRequest(url: episodeUrl))
    }
}
