//
//  APIRequest.swift
//  Benchtime
//
//  Created by Tosun, Irem on 14.06.2024.
//

import Foundation

final class APIRequest<T> {
    var endpoint: URL
    var method: HttpMethod
    var headers: [String: String]
    var parameters: [String: String]
    var body: T?

    init(endpoint: URL, method: HttpMethod, headers: [String: String], parameters: [String: String], body: T?) {
        self.endpoint = endpoint
        self.method = method
        self.headers = headers
        self.parameters = parameters
        self.body = body
    }

    func getURLRequest() -> URLRequest? {
        guard var urlComponents = URLComponents(url: endpoint, resolvingAgainstBaseURL: true) else {
            return nil
        }

        if !parameters.isEmpty {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }

        guard let url = urlComponents.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.name
        request.allHTTPHeaderFields = headers

        if let bodyData = body as? Data {
            request.httpBody = bodyData
        } else if let bodyDict = body as? [String: Any], let jsonData = try? JSONSerialization.data(withJSONObject: bodyDict, options: []) {
            request.httpBody = jsonData
        } else if let bodyString = body as? String, let data = bodyString.data(using: .utf8) {
            request.httpBody = data
        }

        return request
    }
}
