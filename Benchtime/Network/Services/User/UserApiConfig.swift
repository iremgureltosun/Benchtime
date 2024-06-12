//
//  ApiConfig.swift
//  Benchtime
//
//  Created by Tosun, Irem on 7.06.2024.
//

import Foundation

struct UserMockAPI {
    enum ApiConfig {
        private static let baseURL: String = "https://fdc39d9d-cbf6-4ce2-b0dd-3861a530172a.mock.pstmn.io/"

        case all
        case appointments(userId: String)

        var url: String {
            switch self {
            case .all:
                return "\(Self.baseURL)getUsers"
            case let .appointments(userId):
                return "\(Self.baseURL)getAppointments/?userId=\(userId)"
            }
        }
    }
}
