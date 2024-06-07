//
//  User.swift
//  Benchtime
//
//  Created by Tosun, Irem on 7.06.2024.
//

import Foundation
import Network

enum UserType: String, Codable {
    case admin
    case staff
}

struct UserResponse: HTTPResponseProtocol {
    typealias HTTPEntityType = User.Type

    let userId: String
    let companyId: String
    let userType: UserType
    let userName: String
    let jobTitle: String

    enum CodingKeys: String, CodingKey {
        case userId, companyId, userType, userName, jobTitle
    }
}
