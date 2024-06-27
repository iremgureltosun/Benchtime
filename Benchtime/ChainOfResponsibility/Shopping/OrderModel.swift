//
//  Order.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

struct OrderModel {
    let id: String
    let orderDate: Date
    let customerName: String
    let totalPrice: Double
    var inventorySuccess: Bool = false
    private (set) var paymentSuccess: Bool = false
    var shippingSuccess: Bool = false
    private (set) var orderConfirmed: Bool = false
    var customerComments: String

    init(id: String, orderDate: Date, customerName: String, totalPrice: Double, inventorySuccess: Bool, paymentSuccess: Bool, shippingSuccess: Bool, orderConfirmed: Bool, customerComments: String) {
        self.id = id
        self.orderDate = orderDate
        self.customerName = customerName
        self.totalPrice = totalPrice
        self.inventorySuccess = inventorySuccess
        self.paymentSuccess = paymentSuccess
        self.shippingSuccess = shippingSuccess
        self.orderConfirmed = orderConfirmed
        self.customerComments = customerComments
    }

    mutating func checkout() {
        paymentSuccess = true
    }

    mutating func confirm() {
        orderConfirmed = true
    }
}
