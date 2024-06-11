//
//  MockEpisodesService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 11.06.2024.
//


import Foundation

final class MockEpisodeService: EpisodeService {
    func getMultiple(by list: [String]) async throws -> [Episode] {
        let list: [Episode] = try await withCheckedThrowingContinuation { continuation in
            Task {
                let _list: [Episode] = MockDataProvider.loadList(resourceName: "episodes")
                continuation.resume(returning: _list)
            }
        }
        return list
    }
    
    func get(by id: String) async throws -> Episode {
        let episode: Episode = try await withCheckedThrowingContinuation { continuation in
            Task {
                let _item: Episode = MockDataProvider.load(resourceName: "episode")
                continuation.resume(returning: _item)
            }
        }
        return episode
    }
    
}
