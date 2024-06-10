//
//  ListUsersViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 7.06.2024.
//

import Combine
import Foundation
import Observation

@Observable final class ListUsersViewModel {
    @ObservationIgnored private var service: UserService?
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()

    var users: [UserModel] = []
    var selectedUser: UserModel? = nil
    
    func setup(with service: UserService) {
        self.service = service
    }

    func fetchAll() {
        try? service?.getAll()
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
                self.users = response
            }
            .store(in: &cancellables)
    }
}
