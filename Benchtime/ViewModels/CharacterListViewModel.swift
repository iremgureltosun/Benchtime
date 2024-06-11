//
//  CharactersViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//
import Foundation
import Resolver

struct CharacterListViewModel {
    private let debouncer = Debouncer(duration: .seconds(0.5))
    @Injected var service: CharacterService

    var hasAppeared: Bool = false
    var page: Int = 1
    let genderOptions = CharacterGender.allCases
    let statusOptions = CharacterStatus.allCases

    var isLoading: Bool = false
    var searchText: String = ""
    var status: CharacterStatus? = nil
    var gender: CharacterGender? = nil
    var figureList: [Figure] = []

    // Calculated property
    var recordCount: Int {
        figureList.count
    }

    mutating func search() async throws {
        var filterList: [CharacterFilterCriteria] = []
        let filterName = CharacterFilterCriteria.name(text: searchText)
        filterList.append(filterName)

        if let gender = gender {
            filterList.append(.gender(gender: gender))
        }
        if let status = status {
            filterList.append(.status(status: status))
        }

        figureList = []
        figureList = try await service.search(by: filterList).results
    }

    mutating func onSearchTextChanged() async throws {
        guard await debouncer.sleep() else { return }

        if searchText.isEmpty, gender == nil, status == nil {
            try await fetchAll()
        } else {
            figureList = []
            try await search()
        }
    }

    mutating func fetchAll() async throws {
        let response = try await service.search(by: [], page: page)
        self.figureList.insert(contentsOf: response.results, at: 0)
    }
}

actor Debouncer {
    private let duration: Duration
    private var isPending = false

    init(duration: Duration) {
        self.duration = duration
    }

    func sleep() async -> Bool {
        if isPending { return false }
        isPending = true
        try? await Task.sleep(for: duration)
        isPending = false
        return true
    }
}

extension CharacterStatus: Identifiable {
    var id: String { rawValue }
}

extension CharacterGender: Identifiable {
    var id: String { rawValue }
}
