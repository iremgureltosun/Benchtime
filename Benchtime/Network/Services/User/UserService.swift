//
//  UserService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 7.06.2024.
//

import Foundation
import Observation

protocol UserService {
    var users: [UserModel] { get }
    func getAll() async throws
}

@Observable final class UserServiceImpl: CoreNetworkService<UserModel>, UserService {
    private(set) var users: [UserModel] = []

    func getAll() async throws {
        guard let url = URL(string: UserMockAPI.ApiConfig.all.url) else {
            throw HTTPError.invalidRequest
        }
        users = try await callAPI(URLRequest(url: url))
    }
}
