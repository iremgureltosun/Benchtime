//
//  EpisodeHelper.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.05.2024.
//

import Foundation
public struct EpisodeHelper {
     func getListOfEpisodeIds(_ episodes: [String]) -> [String] {
        return episodes.map { url in
            let components = url.components(separatedBy: "/")
            return components.last ?? ""
        }
    }
    
    
}
