//
//  APIRequestBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 14.06.2024.
//

import Foundation

protocol APIRequestBuilder {
    associatedtype Body

    func setMethod(_ method: HttpMethod) -> Self
    func addHeader(key: String, value: String) -> Self
    func addParameter(key: String, value: String) -> Self
    func setBody(_ body: Body) -> Self
    func build() -> APIRequest<Body>
}
