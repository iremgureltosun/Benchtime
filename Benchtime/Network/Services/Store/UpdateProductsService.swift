//
//  UpdateProductsService.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import Foundation

protocol UpdateProductsService {
    var message: String { get }
    func addProduct(product: ProductRequest) async throws
}

@Observable final class UpdateProductsServiceImpl: CoreNetworkService<ProductResponse>, UpdateProductsService {
    var message: String = ""
    
    func addProduct(product: ProductRequest) async throws {
        message = "In progress.."
        do {
            guard let url = URL(string: StoreFakeAPI.Endpoint.addProduct.url) else {
                throw HTTPError.invalidRequest
            }
            // Building the url request with builder pattern

            let data = try JSONEncoder().encode(product)
            
            let apiRequest = APIRequestBuilderImpl<Data>(url)
                .setMethod(.post)
                .setBody(data)
                .setContentType(contentType: .formURLEncoded)
                .build()

            guard let urlRequest = apiRequest.getURLRequest() else {
                throw HTTPError.invalidRequest
            }

            try await callAPI(urlRequest)

            message = "Product added successfully!"
        } catch {
            print(error)
        }
    }
}
