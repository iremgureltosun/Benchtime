import Foundation

let helper = EpisodeHelper()
let input = ["https://rickandmortyapi.com/api/episode/47",
             "https://rickandmortyapi.com/api/episode/48",
             "https://rickandmortyapi.com/api/episode/49",
             "https://rickandmortyapi.com/api/episode/50"]

let result = helper.getListOfEpisodeIds(input)


let test = ApiConfig.episodes.getMultiple(by: result)
