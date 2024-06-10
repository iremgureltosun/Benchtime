//
//  AppointmentsService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 10.06.2024.
//

import Foundation
import Network
import Combine

protocol AppointmentsService {
    func getAppointments(of userId: String) throws -> AnyPublisher<[AppointmentModel], Error>
}

final class AppointmentsServiceImpl: CoreNetworkService<AppointmentModel>, AppointmentsService {
    
    func getAppointments(of userId: String) throws -> AnyPublisher<[AppointmentModel], Error> {
        guard let url = URL(string: User.ApiConfig.appointments(userId: userId).url) else {
            throw HTTPError.invalidRequest
        }
        return try performRequest(urlRequest: URLRequest(url: url))
    }
}
