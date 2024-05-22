//
//  CharactersViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Combine
import Observation
import SwiftUI

@Observable final class CharactersViewModel {
    var figureList: [Figure] = []
    
    @ObservationIgnored
    var page: Int = 1
    
    var isLoading: Bool = false
    var name: String = ""
    var status: CharacterStatus?
    var gender: CharacterGender?

    var recordCount: Int {
        figureList.count
    }

    @ObservationIgnored
    private var service: CharacterService?

    @ObservationIgnored
    private var cancellables = Set<AnyCancellable>()

    @ObservationIgnored
    let listItems: [GridItem] = Array(repeating: .init(.fixed(CGFloat(100))), count: 3)

    func setup(with service: CharacterService) {
        self.service = service
        print("Setup is done")
    }

    func search() throws {
        try service?.search(page: page, name: name, status: status, gender: gender)
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
    func fetchAll() throws {
        try service?.search(page: page, name: "", status: nil, gender: nil)
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
