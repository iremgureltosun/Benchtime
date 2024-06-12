//
//  AppointmentsService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 10.06.2024.
//

import Foundation
import Observation

protocol AppointmentsService {
    var appointments: [AppointmentModel] { get }
    func fetchAppointments(of userId: String) async throws
}

@Observable final class AppointmentsServiceImpl: CoreNetworkService<AppointmentModel>, AppointmentsService {
    var appointments: [AppointmentModel] = []

    func fetchAppointments(of userId: String) async throws {
        guard let url = URL(string: UserMockAPI.ApiConfig.appointments(userId: userId).url) else {
            throw HTTPError.invalidRequest
        }
        appointments = try await callAPI(URLRequest(url: url))
    }
}
