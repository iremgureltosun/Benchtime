//
//  ProductViewState.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import Foundation

struct ProductViewState {
    var selectedCategory: Category?
    var title: String
    var price: Double
    var description: String
    let image: String = "i.pravatar.cc"
    
    var productRequest: ProductRequest {
        .init(title: title, price: price, description: description, image: image, category: selectedCategory)
    }
}
