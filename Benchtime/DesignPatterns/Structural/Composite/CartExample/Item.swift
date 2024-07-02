//
//  Item.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import Foundation

/// The Leaf class represents individual items in the shopping cart.

final class Item: ShoppingCartComponent {
    let name: String
    let price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    
    func getPrice() -> Double {
        return price
    }
}
