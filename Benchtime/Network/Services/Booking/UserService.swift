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
        guard let url = URL(string: BookingMockAPI.Endpoint.users.url) else {
            throw HTTPError.invalidRequest
        }
        
        // Building the url request with builder pattern
        let apiRequest = APIRequestBuilderImpl<Data>(url)
            .setMethod(.get)
            .build()
        
        guard let urlRequest = apiRequest.getURLRequest() else {
            throw HTTPError.invalidRequest
        }
        
        users = try await callAPIForMultipleResults(urlRequest)
    }
}
