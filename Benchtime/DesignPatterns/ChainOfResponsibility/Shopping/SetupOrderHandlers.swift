//
//  SetupOrderHandlers.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

struct SetupOrderHandlers {
    static func setup() -> CheckInventoryHandler {
        let checkInventoryHandler = CheckInventoryHandler()
        let paymentHandler = PaymentHandler()
        let shippingHandler = ShippingHandler()
        let confirmHandler = ConfirmHandler()
        
        checkInventoryHandler.next = paymentHandler
        paymentHandler.next = shippingHandler
        shippingHandler.next = confirmHandler
        
        return checkInventoryHandler
    }
}
