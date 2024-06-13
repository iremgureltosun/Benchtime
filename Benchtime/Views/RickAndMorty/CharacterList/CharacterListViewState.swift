//
//  CharacterListState.swift
//  Benchtime
//
//  Created by Tosun, Irem on 12.06.2024.
//

import Foundation

struct CharacterListViewState {
    var isLoading: Bool = false
    var searchText: String = ""
    var status: CharacterStatus?
    var gender: CharacterGender?
    var page: Int = 1
    var filterDictionary: [FilterKey: CharacterFilterCriteria] = [:]

}
