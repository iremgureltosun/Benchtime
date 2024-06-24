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
    func addProduct(product: ProductRequest) async throws
}

@Observable final class ProductServiceImpl: CoreNetworkService<Product>, ProductService {
    private(set) var products: [Product] = []

    func getAll() async throws {
        guard let url = URL(string: StoreFakeAPI.Endpoint.allProducts(limit: 100).url) else {
            throw HTTPError.invalidRequest
        }

        // Building the url request with builder pattern
        let apiRequest = APIRequestBuilderImpl<Data>(url)
            .setMethod(.get)
            .build()

        guard let urlRequest = apiRequest.getURLRequest() else {
            throw HTTPError.invalidRequest
        }
        do {
            products = try await callAPIForMultipleResults(urlRequest)
        } catch {
            if let decodingError = error as? DecodingError {
                // Handle specific decoding errors
                switch decodingError {
                case let .typeMismatch(type, context):
                    print("Type mismatch error: \(type), context: \(context.debugDescription).")
                case let .valueNotFound(type, context):
                    print("Value not found error: \(type), context: \(context.debugDescription).")
                case let .keyNotFound(key, context):
                    print("Key not found error: \(key), context: \(context.debugDescription).")
                case let .dataCorrupted(context):
                    print("Data corrupted error: \(context.debugDescription).")
                @unknown default:
                    print("Unknown decoding error: \(decodingError.localizedDescription).")
                }
            }
        }
    }

    func addProduct(product: ProductRequest) async throws {
        do {
            guard let url = URL(string: StoreFakeAPI.Endpoint.addProduct.url) else {
                throw HTTPError.invalidRequest
            }
            // Building the url request with builder pattern

            let data = try JSONEncoder().encode(product)
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }
            let apiRequest = APIRequestBuilderImpl<Data>(url)
                .setMethod(.post)
                .setBody(data)
                .build()

            guard let urlRequest = apiRequest.getURLRequest() else {
                throw HTTPError.invalidRequest
            }

            let result = try await callAPI(urlRequest)

            print("Product added successfully! \(result)")
        } catch {
            print(error)
        }
    }
}
