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

struct UserModel: HTTPResponseProtocol {
    typealias HTTPEntityType = UserModel.Type

    let userId: String
    let companyId: String
    let userType: UserType
    let userName: String
    let jobTitle: String

    enum CodingKeys: String, CodingKey {
        case userId, companyId, userType, userName, jobTitle
    }
}

extension UserModel: Identifiable {
    var id: String {
        return userId
    }
}
