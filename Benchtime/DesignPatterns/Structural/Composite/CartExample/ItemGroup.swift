//
//  ItemGroup.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import Foundation

/// The Composite class represents groups of items in the shopping cart. It can contain both individual items and other groups.
///
final class ItemGroup: ShoppingCartComponent {
    let name: String
    private var items = [ShoppingCartComponent]()
    
    init(name: String) {
        self.name = name
    }
    
    func addItem(_ item: ShoppingCartComponent) {
        items.append(item)
    }
    
    var price: Double {
        return items.reduce(0) { $0 + $1.price }
    }
    
    func getPrice() -> Double {
        return items.reduce(0) { $0 + $1.getPrice() }
    }
}

