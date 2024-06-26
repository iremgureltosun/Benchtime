//
//  ShippingHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

final class ShippingHandler: HandlerProtocol {
    typealias T = Order
    
    func handle(_ input: inout Order) {
        if input.isShipped {
            print("Order \(input.id) has been shipped.")
        } else {
            print("Order \(input.id) shipping failed. Stopping the process.")
        }
    }
}
