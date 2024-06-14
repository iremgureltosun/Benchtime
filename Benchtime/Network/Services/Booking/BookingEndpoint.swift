//
//  ApiConfig.swift
//  Benchtime
//
//  Created by Tosun, Irem on 7.06.2024.
//

import Foundation

struct BookingMockAPI {
    enum Endpoint {
        private static let baseURL: String = "https://fdc39d9d-cbf6-4ce2-b0dd-3861a530172a.mock.pstmn.io/"

        case users
        case appointments(userId: String)

        var url: String {
            switch self {
            case .users:
                return "\(Self.baseURL)getUsers"
            case let .appointments(userId):
                return "\(Self.baseURL)getAppointments/?userId=\(userId)"
            }
        }
    }
}
