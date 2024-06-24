//
//  StoreAPI.swift
//  Benchtime
//
//  Created by Tosun, Irem on 14.06.2024.
//

import Foundation

struct StoreFakeAPI {
    enum Endpoint {
        private static let baseURL: String = "https://fakestoreapi.com/"

        case allProducts(limit: Int)
        case addProduct
        case updateProduct(id: String), deleteProduct(id: String)

        var url: String {
            switch self {
            case .allProducts(let limit):
                return "\(Self.baseURL)products?limit=\(limit)"
            case .addProduct:
                return "\(Self.baseURL)products"
            case let .updateProduct(id), let .deleteProduct(id):
                return "\(Self.baseURL)products/\(id)"
            }
        }
    }
}
