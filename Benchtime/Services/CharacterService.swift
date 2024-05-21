//
//  CharacterService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Foundation
import Combine
import Network

@available(iOS 13.0, *)
protocol CharacterService {
    func search(page: Int, name: String, status: CharacterStatus?, gender: CharacterGender?) throws -> AnyPublisher<CharacterResponse, Error>
}

@available(iOS 13.0, *)
final class CharacterServiceImpl: CoreNetworkService<CharacterResponse>, CharacterService {
    func search(page: Int, name: String, status: CharacterStatus?, gender: CharacterGender?) throws -> AnyPublisher<CharacterResponse, Error> {
        
        guard let charactersUrl = ApiConfig.characters.getAll(page: page, name: name, status: status, gender: gender) else {
            throw HTTPError.invalidRequest
        }
        return try performRequest(urlRequest: URLRequest(url: charactersUrl))
    }
}
