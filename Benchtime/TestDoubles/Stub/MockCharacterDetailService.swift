//
//  MockDetailService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 5.06.2024.
//

import Combine
import Foundation

final class MockCharacterDetailService: Observable, CharacterDetailService {
    func get(by id: String) async throws -> Figure {
        let figure: Figure = try await withCheckedThrowingContinuation { continuation in
            Task {
                let figure: Figure = MockDataProvider.load(resourceName: "characterDetail")
                continuation.resume(returning: figure)
            }
        }
        return figure
    }
}
