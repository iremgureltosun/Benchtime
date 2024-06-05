//
//  MockDetailService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 5.06.2024.
//

import Combine
import Foundation

final class MockCharacterDetailService: Observable, CharacterDetailService {
    func get(by id: String) throws -> AnyPublisher<Figure, any Error> {
        return Future<Figure, Error> { promise in
            Task {
                let figure: Figure = MockDataProvider.load(resourceName: "characterDetail")
                promise(.success(figure))
            }
        }
        .eraseToAnyPublisher()
    }
}
