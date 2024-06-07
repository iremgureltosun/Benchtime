//
//  UserService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 7.06.2024.
//

import Combine
import Foundation
import Network

@available(iOS 13.0, *)
protocol UserService { 
    func getAll() throws -> AnyPublisher<[UserModel], Error>
}

@available(iOS 13.0, *)
final class UserServiceImpl: CoreNetworkService<UserModel>, UserService {
    
    func getAll() throws -> AnyPublisher<[UserModel], Error> {
        guard let url = URL(string: User.ApiConfig.all.url) else {
            throw HTTPError.invalidRequest
        }
        return try performRequest(urlRequest: URLRequest(url: url))
    }
}
