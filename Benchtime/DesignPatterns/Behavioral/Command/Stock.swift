//
//  Stock.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import Foundation

final class Stock {
    var symbol: String
    var price: Double

    init(symbol: String, price: Double) {
        self.symbol = symbol
        self.price = price
    }
}

extension Stock: Hashable {
    // Conform to Equatable
    static func == (lhs: Stock, rhs: Stock) -> Bool {
        return lhs.symbol == rhs.symbol && lhs.price == rhs.price
    }

    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(symbol)
        hasher.combine(price)
    }
}

