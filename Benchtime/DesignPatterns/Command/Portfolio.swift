//
//  Portfolio.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import Foundation

final class Portfolio {
    private(set) var holdings: [Stock: Int] = [:]

    func buy(stock: Stock, quantity: Int) {
        holdings[stock, default: 0] += quantity
        print("Bought \(quantity) of \(stock.symbol). Total holdings: \(holdings[stock] ?? 0)")
    }

    func sell(stock: Stock, quantity: Int) {
        holdings[stock, default: 0] -= quantity
        if holdings[stock]! <= 0 {
            holdings[stock] = nil
        }
        print("Sold \(quantity) of \(stock.symbol). Total holdings: \(holdings[stock] ?? 0)")
    }
}
