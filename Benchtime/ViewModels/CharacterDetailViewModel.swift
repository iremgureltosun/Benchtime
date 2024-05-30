//
//  CharacterDetailViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//
import Combine
import Foundation

@Observable final class CharacterDetailViewModel {
    @ObservationIgnored let id: String
    @ObservationIgnored var characterService: CharacterDetailService?
    @ObservationIgnored var episodeService: EpisodeService?
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()

    var characterDetails: Figure?
    var episodes: [Episode] = []

    init(id: String) {
        self.id = id
    }

    func setup(characterService: CharacterDetailService, episodeService: EpisodeService) {
        self.characterService = characterService
        self.episodeService = episodeService
    }

    func getCharacter() {
        guard let characterService = characterService, let episodeService = episodeService else {
            print("Error: characterService or episodeService is nil")
            return
        }

        // Call the character service to get character details
        try? characterService.get(by: id)
            .tryMap { character -> AnyPublisher<[Episode], Error> in
                self.characterDetails = character
                let listOfEpisodes = EpisodeHelper().getListOfEpisodeIds(character.episode)
                if listOfEpisodes.count > 1 {
                    return try episodeService.getMultiple(by: listOfEpisodes)
                } else if let singleEpisodeId = listOfEpisodes.first {
                    return try episodeService.get(by: singleEpisodeId)
                        .map { [$0] } // Wrap single episode in an array
                        .mapError { $0 as Error }
                        .eraseToAnyPublisher()
                } else {
                    return Empty<[Episode], Error>().eraseToAnyPublisher()
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    // Handle successful completion if needed
                    break
                case let .failure(error):
                    // Handle error
                    print("Error: \(error)")
                }
            }, receiveValue: { episodes in
                // Handle received episodes
                episodes.sink { completion in
                    switch completion {
                    case .finished:
                        // Handle successful completion if needed
                        break
                    case let .failure(error):
                        // Handle error
                        print("Error: \(error)")
                    }
                } receiveValue: { list in
                    self.episodes = list
                }
                .store(in: &self.cancellables)
            })
            .store(in: &cancellables)
    }
}
