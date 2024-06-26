//
//  PaymentHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

final class PaymentHandler: HandlerProtocol {
    typealias T = Order
    
    var next: ShippingHandler?

    func handle(_ input: inout Order) {
        if input.isPaid {
            print("Order \(input.id) has been paid.")
            next?.handle(&input)
        } else {
            print("Order \(input.id) payment failed. Stopping the process.")
        }
    }
}
