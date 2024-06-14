//
//  HttpMethod.swift
//  Benchtime
//
//  Created by Tosun, Irem on 14.06.2024.
//

import Foundation

enum HttpMethod {
    case get
    case put
    case post
    case delete
    case head

    var name: String {
        switch self {
        case .get: return "GET"
        case .put: return "PUT"
        case .post: return "POST"
        case .delete: return "DELETE"
        case .head: return "HEAD"
        }
    }
}
