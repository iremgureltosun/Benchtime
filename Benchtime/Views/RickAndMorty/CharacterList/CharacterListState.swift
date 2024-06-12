//
//  CharacterListState.swift
//  Benchtime
//
//  Created by Tosun, Irem on 12.06.2024.
//

import Foundation

struct CharacterListState {
    var isLoading: Bool = false
    var searchText: String = ""
    var status: CharacterStatus?
    var gender: CharacterGender?
    var hasAppeared: Bool = false
    var page: Int = 1
    var filterList: [FilterKey: CharacterFilterCriteria] = [:]

}
