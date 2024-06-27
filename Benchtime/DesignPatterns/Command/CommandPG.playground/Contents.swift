import UIKit

let portfolio = Portfolio()
let invoker = CommandInvoker()

let appleStock = Stock(symbol: "AAPL", price: 150.0)
let teslaStock = Stock(symbol: "TSLA", price: 700.0)

// Buy stocks
let buyAppleCommand = BuyStockCommand(portfolio: portfolio, stock: appleStock, quantity: 10)
invoker.executeCommand(buyAppleCommand)

let buyTeslaCommand = BuyStockCommand(portfolio: portfolio, stock: teslaStock, quantity: 5)
invoker.executeCommand(buyTeslaCommand)

// Sell stocks
let sellAppleCommand = SellStockCommand(portfolio: portfolio, stock: appleStock, quantity: 5)
invoker.executeCommand(sellAppleCommand)

// Undo the last operation (sell Apple stock)
invoker.undo()

// Redo the last undone operation (sell Apple stock)
invoker.redo()
