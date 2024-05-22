//
//  CharacterDetailViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//
import Combine
import Foundation

@Observable final class CharacterDetailViewModel {
    @ObservationIgnored let id: String
    @ObservationIgnored var service: CharacterDetailService?
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    
    var characterDetails: Figure?
    
    init(id: String) {
        self.id = id
    }
    
    func setup(service: CharacterDetailService){
        self.service = service
    }
    func getCharacter(){
        try? service?.get(by: id)
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
                self.characterDetails = response
            }
            .store(in: &cancellables)
    }
}
