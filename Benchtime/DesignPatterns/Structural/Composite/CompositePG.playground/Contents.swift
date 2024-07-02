import UIKit

let items = [2, 2, 5]
let totalPrice = items.reduce(0) { $0 + $1 }
totalPrice.description

// Create individual items
let apple = Item(name: "Apple", price: 1.0)
let banana = Item(name: "Banana", price: 0.5)
let orange = Item(name: "Orange", price: 1.2)

// Create a group of fruits
let fruitBox = ItemGroup(name: "Fruit Box")
fruitBox.addItem(apple)
fruitBox.addItem(banana)
fruitBox.addItem(orange)

// Create more individual items
let milk = Item(name: "Milk", price: 2.0)
let bread = Item(name: "Bread", price: 1.5)

// Create another group
let breakfastBox = ItemGroup(name: "Breakfast Box")
breakfastBox.addItem(milk)
breakfastBox.addItem(bread)

// Create the main shopping cart
let shoppingCart = ItemGroup(name: "Shopping Cart")
shoppingCart.addItem(fruitBox)
shoppingCart.addItem(breakfastBox)

// Calculate total price
let total = shoppingCart.totalPrice()
print("Total price of the shopping cart: \(total)")
