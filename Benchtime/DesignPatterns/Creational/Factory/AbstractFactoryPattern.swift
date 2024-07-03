//
//  AbstractFactoryPattern.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import Foundation

protocol Order {
    func displayDetails() -> String
}

struct FoodOrder: Order {
    func displayDetails() -> String {
        "I am food order"
    }
}

struct ClothesOrder: Order {
    func displayDetails() -> String {
        "I am clothes order"
    }
}

struct ServicesOrder: Order {
    func displayDetails() -> String {
        "I am services order"
    }
}

protocol ShopFactory {
    func createOrder() -> Order
}

class FoodOrderFactory: ShopFactory {
    func createOrder() -> Order {
        FoodOrder()
    }
}

class ClothesOrderFactory: ShopFactory {
    func createOrder() -> Order {
        ClothesOrder()
    }
}

class ServicesOrderFactory: ShopFactory {
    func createOrder() -> Order {
        ServicesOrder()
    }
}
