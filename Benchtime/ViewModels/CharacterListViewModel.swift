//
//  CharactersViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Combine
import Observation
import SwiftUI

@Observable final class CharacterListViewModel {
    @ObservationIgnored private let debouncer = Debouncer(duration: .seconds(0.5))
    @ObservationIgnored private var service: CharacterService?
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    @ObservationIgnored var page: Int = 1

    var isLoading: Bool = false
    var searchText: String = ""
    var status: CharacterStatus?
    var gender: CharacterGender?
    var figureList: [Figure] = []

    // Some calculated properties
    var recordCount: Int {
        figureList.count
    }

    func setup(with service: CharacterService) {
        self.service = service
    }

    func search() throws {
        let filter = CharacterFilterCriteria.name(text: searchText)
        figureList = []
        try service?.search(by: filter)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    // Handle successful completion
                    break
                case let .failure(error):
                    // Handle failure
                    print("Error: \(error)")
                }
            } receiveValue: { response in
                self.figureList = response.results
            }
            .store(in: &cancellables)
    }

    func onSearchTextChanged() async {
        guard await debouncer.sleep() else { return }

        let filter = CharacterFilterCriteria.name(text: searchText)
        if case let .name(text) = filter, text.isEmpty {
            try? fetchAll()
        } else {
            figureList = []
            try? search()
        }
    }

    func fetchAll() throws {
        let filter = CharacterFilterCriteria.none(page: page)
        try service?.search(by: filter)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    // Handle successful completion
                    break
                case let .failure(error):
                    self.figureList = []
                    // Handle failure
                    print("Error: \(error)")
                }
            } receiveValue: { response in
                self.figureList.insert(contentsOf: response.results, at: 0)
            }
            .store(in: &cancellables)
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
