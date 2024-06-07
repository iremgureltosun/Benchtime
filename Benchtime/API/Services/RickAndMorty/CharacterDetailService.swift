//
//  CharacterDetailService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import Combine
import Foundation
import Network

@available(iOS 13.0, *)
protocol CharacterDetailService {
    func get(by id: String) throws -> AnyPublisher<Figure, Error>
}

@available(iOS 13.0, *)
final class CharacterDetailServiceImpl: CoreNetworkService<Figure>, CharacterDetailService {

    func get(by id: String) throws -> AnyPublisher<Figure, Error> {
        guard let charactersUrl = RickAndMorty.ApiConfig.characters.get(by: id) else {
            throw HTTPError.invalidRequest
        }
        return try performRequest(urlRequest: URLRequest(url: charactersUrl))
    }
}
