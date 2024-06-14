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
        guard let url = URL(string: BookingMockAPI.Endpoint.appointments(userId: userId).url) else {
            throw HTTPError.invalidRequest
        }
        
        // Building the url request with builder pattern
        let apiRequest = APIRequestBuilderImpl<Data>(url)
            .setMethod(.get)
            .build()
        
        guard let urlRequest = apiRequest.getURLRequest() else {
            throw HTTPError.invalidRequest
        }
        
        appointments = try await callAPI(urlRequest)
    }
}
