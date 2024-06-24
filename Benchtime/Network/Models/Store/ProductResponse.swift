//
//  ProductResponse.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import Foundation

struct ProductResponse: HTTPResponseProtocol {
    typealias HTTPEntityType = ProductResponse.Type

    let id: Int
    let title: String?
    let price: String?
    let description: String?
    let category: Category?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id, title, price, description, category, image
    }
}
