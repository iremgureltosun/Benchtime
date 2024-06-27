//
//  PaymentHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

final class PaymentHandler: HandlerProtocol {
    typealias T = OrderModel
    
    var next: ShippingHandler?

    func handle(_ input: inout OrderModel) throws {
        input.checkout()
        
        if input.paymentSuccess {
            print("Order \(input.id) has been paid.")
            
            var shipping = ShippingModel.init(order: input, deliveryAddress: "eee", postalCode: "3333", cityName: "Istanbul", deliveryStartDate: Date())
            try next?.handle(&shipping)
            
        } else {
            print("Order \(input.id) payment failed. Stopping the process.")
        }
    }
}
