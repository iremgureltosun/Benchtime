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
    @ObservationIgnored var hasAppeared: Bool = false
    @ObservationIgnored var page: Int = 1
    let genderOptions = CharacterGender.allCases
    let statusOptions = CharacterStatus.allCases

    var isLoading: Bool = false
    var searchText: String = ""
    var status: CharacterStatus?
    var gender: CharacterGender?
    var figureList: [Figure] = []

    // Calculated property
    var recordCount: Int {
        figureList.count
    }

    func setup(with service: CharacterService) {
        self.service = service
    }

    func search() throws {
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
        try service?.search(by: filterList)
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
        try service?.search(by: [], page: page)
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

extension CharacterStatus: Identifiable {
    var id: String { rawValue }
}

extension CharacterGender: Identifiable {
    var id: String { rawValue }
}
