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

    mutating func setFilterOfText(text: String) {
        if !text.isEmpty {
            filterDictionary[.name] = CharacterFilterCriteria.name(text: text)
        } else {
            filterDictionary[.name] = nil
        }
    }

    mutating func setFilterOfGender(gender: CharacterGender?) {
        if let gender = gender {
            let genderFilter = CharacterFilterCriteria.gender(gender: gender)
            filterDictionary[.gender] = genderFilter
        } else {
            filterDictionary[.gender] = nil
        }
    }

    mutating func setFilterOfStatus(status: CharacterStatus?) {
        if let status = status {
            let statusFilter = CharacterFilterCriteria.status(status: status)
            filterDictionary[.status] = statusFilter
        } else {
            filterDictionary[.status] = nil
        }
    }
}
