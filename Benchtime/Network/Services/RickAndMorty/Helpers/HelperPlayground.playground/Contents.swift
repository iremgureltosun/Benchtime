import Foundation

let helper = EpisodeHelper()
let input = ["https://rickandmortyapi.com/api/episode/147",
             "https://rickandmortyapi.com/api/episode/1",
             "https://rickandmortyapi.com/api/episode/13",
             "https://rickandmortyapi.com/api/episode/50"]

let result = helper.getListOfEpisodeIds(input)


let test = RickAndMorty.ApiConfig.episodes.getMultiple(by: result)

let list = [CharacterFilterCriteria.name(text: "jessie"),
            CharacterFilterCriteria.status(status: CharacterStatus.alive),
            CharacterFilterCriteria.gender(gender: CharacterGender.female)]

let queryHelper = CharacterHelper()
let urlString = queryHelper.makeUrlString(with: list)
let getAllUrlString = queryHelper.makeUrlString(with: [])

let detail: Figure = MockDataProvider.load(resourceName: "characterDetail")

let date: String = Date().ISO8601Format()
