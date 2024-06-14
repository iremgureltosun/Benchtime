//
//  RickAndMortyRequestBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 14.06.2024.
//

import Foundation

final class CharactersAPIRequestBuilder<T>: APIRequestBuilder {
    private var endpoint: URL
    private var method: HttpMethod = .get
    private var headers: [String: String] = [:]
    private var parameters: [String: String] = [:]
    private var body: T? = nil

    init(_ endpoint: URL) {
        self.endpoint = endpoint
    }

    func setMethod(_ method: HttpMethod) -> Self {
        self.method = method
        return self
    }

    func addHeader(key: String, value: String) -> Self {
        self.headers[key] = value
        return self
    }

    func addParameter(key: String, value: String) -> Self {
        self.parameters[key] = value
        return self
    }

    func setBody(_ body: T) -> Self {
        self.body = body
        return self
    }

    func build() -> APIRequest<T> {
        return APIRequest(endpoint: endpoint, method: method, headers: headers, parameters: parameters, body: body)
    }
}
