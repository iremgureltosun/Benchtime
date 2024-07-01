//
//  SellStockCommand.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import Foundation

final class SellStockCommand: Command {
    private var portfolio: Portfolio
    private var stock: Stock
    private var quantity: Int

    init(portfolio: Portfolio, stock: Stock, quantity: Int) {
        self.portfolio = portfolio
        self.stock = stock
        self.quantity = quantity
    }

    func execute() {
        portfolio.sell(stock: stock, quantity: quantity)
    }

    func undo() {
        portfolio.buy(stock: stock, quantity: quantity)
    }
}
