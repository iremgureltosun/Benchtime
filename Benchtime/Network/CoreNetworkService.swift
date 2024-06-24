//
//  File.swift
//  Benchtime
//
//  Created by Tosun, Irem on 11.06.2024.
//

import Foundation

protocol HTTPResponseProtocol: Codable {
    associatedtype HTTPEntityType
}

class CoreNetworkService<T> where T: HTTPResponseProtocol {
    let urlSession: URLSession
    private var jsonDecoder: JSONDecoder = .init()
    var debugText: String = ""

    init() {
        urlSession = URLSession(configuration: URLSessionConfiguration.default)
    }

    func callAPI(_ urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPError.invalidResponse(HttpStatusCode.ClientError.badRequest)
        }
        guard HttpStatusCode.Success.range.contains(httpResponse.statusCode) else {
            throw HTTPError.invalidResponse(httpResponse.statusCode)
        }

        let result = try JSONDecoder().decode(T.self, from: data)
        return result
    }
    
    func callAPIForMultipleResults(_ urlRequest: URLRequest) async throws -> [T]{
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPError.invalidResponse(HttpStatusCode.ClientError.badRequest)
        }
        guard HttpStatusCode.Success.range.contains(httpResponse.statusCode) else {
            throw HTTPError.invalidResponse(httpResponse.statusCode)
        }
        let result = try JSONDecoder().decode([T].self, from: data)
        return result
    }
}

enum HTTPError: Equatable {
    case statusCode(Int)
    case invalidResponse(Int)
    case notFoundResponse
    case invalidRequest
}

extension HTTPError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response"
        case .notFoundResponse:
            return "Not found"
        case let .statusCode(int):
            return String(int)
        case .invalidRequest:
            return "Invalid request"
        }
    }
}

enum APIError: Error {
    case timeout
    case emptyResponse
    case invalidUrl
}

struct HttpStatusCode {
    enum Informational {
        static let range = 100 ..< 200
    }

    enum Success {
        static let range = 200 ..< 300
    }

    enum Redirection {
        static let range = 300 ..< 400
    }

    enum ClientError {
        static let range = 400 ..< 500
        static let badRequest = 400
        static let notFoundError = 401
    }

    enum ServerError {
        static let range = 500 ..< 600
    }
}

enum EndPointError: Error {
    case urlFailure
}
