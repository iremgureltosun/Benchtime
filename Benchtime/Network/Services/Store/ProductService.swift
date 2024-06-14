//
//  ProductService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 14.06.2024.
//

import Foundation
import Observation

protocol ProductService {
    var products: [Product] { get }
    func getAll() async throws
}

@Observable final class ProductServiceImpl: CoreNetworkService<Product>, ProductService {
    private(set) var products: [Product] = []

    func getAll() async throws {
        guard let url = URL(string: StoreFakeAPI.Endpoint.allProducts.url) else {
            throw HTTPError.invalidRequest
        }
        
        // Building the url request with builder pattern
        let apiRequest = APIRequestBuilderImpl<Data>(url)
            .setMethod(.get)
            .build()
        
        guard let urlRequest = apiRequest.getURLRequest() else {
            throw HTTPError.invalidRequest
        }
        
        products = try await callAPI(urlRequest)
    }
}
