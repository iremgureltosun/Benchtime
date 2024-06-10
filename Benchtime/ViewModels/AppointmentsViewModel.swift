//
//  AppointmentsViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 10.06.2024.
//

import Combine
import Foundation
import Observation

@Observable final class AppointmentsViewModel {
    @ObservationIgnored var userId: String?
    @ObservationIgnored var service: AppointmentsService?
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()

    var appointments: [AppointmentModel] = []

    func setup(userId: String, service: AppointmentsService) {
        self.userId = userId
        self.service = service
    }

    func fetchAppointments() {
        guard let userId = userId else {
            return
        }
        try? service?.getAppointments(of: userId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    // Handle successful completion
                    break
                case let .failure(error):
                    // Handle failure
                    print("Error: \(error)")
                }
            }, receiveValue: { list in
                self.appointments = list
            })
            .store(in: &cancellables)
    }
}
