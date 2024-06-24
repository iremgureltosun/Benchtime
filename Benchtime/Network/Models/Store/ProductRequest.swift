//
//  ProductRequest.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import Foundation

struct ProductRequest: Encodable {
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: Category?
    
    enum CodingKeys: String, CodingKey {
        case title, price, description, category, image
    }
}
