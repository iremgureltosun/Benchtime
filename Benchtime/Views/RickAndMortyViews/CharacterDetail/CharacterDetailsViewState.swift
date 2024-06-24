//
//  CharacterDetailsState.swift
//  Benchtime
//
//  Created by Tosun, Irem on 11.06.2024.
//

import Foundation
import Resolver
import Observation

@Observable final class CharacterDetailsViewState {
    let characterService: CharacterDetailService
    let episodeService: EpisodeService
    var characterDetails: Figure?
    var episodes: [Episode] = []
    
    init(characterService: CharacterDetailService, episodeService: EpisodeService, characterDetails: Figure? = nil, episodes: [Episode] = []) {
        self.characterService = characterService
        self.episodeService = episodeService
        self.characterDetails = characterDetails
        self.episodes = episodes
    }
    
    func getCharacter(id: String) async throws {
        characterDetails = try await characterService.get(by: id)
        let listOfEpisodes = EpisodeHelper().getListOfEpisodeIds(characterDetails?.episode ?? [])
        if listOfEpisodes.count > 1 {
            episodes = try await episodeService.getMultiple(by: listOfEpisodes)
        } else if let singleEpisodeId = listOfEpisodes.first {
            let episode = try await episodeService.get(by: singleEpisodeId)
            episodes = [episode]
        } else {
            episodes = []
        }
    }
}
