//
//  Appointment.swift
//  Benchtime
//
//  Created by Tosun, Irem on 10.06.2024.
//

import Foundation
import Network

struct AppointmentModel: HTTPResponseProtocol {
    typealias HTTPEntityType = UserModel.Type

    let customerName: String
    private let appointmentStartDate: String
    private let appointmentEndDate: String
    let subject: String

    enum CodingKeys: String, CodingKey {
        case customerName, appointmentStartDate, appointmentEndDate, subject
    }
}

extension AppointmentModel: Identifiable {
    var id: String {
        return UUID().uuidString
    }
    var date: String {
        return appointmentStartDate.convertISO8601ToDate()?.dateString() ?? "unknown"
    }
    var startTime: String {
        return appointmentStartDate.convertISO8601ToDate()?.timeString() ?? "unknown"
    }
    var endTime: String {
        return appointmentEndDate.convertISO8601ToDate()?.timeString() ?? "unknown"
    }
}
