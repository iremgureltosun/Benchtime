//
//  ValidationHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

final class CheckInventoryHandler: HandlerProtocol {
    typealias T = Order

    var next: PaymentHandler?

    func handle(_ input: inout Order) {
        if input.isValid {
            print("Order \(input.id) is valid.")
            next?.handle(&input)
        } else {
            print("Order \(input.id) is invalid. Stopping the process.")
        }
    }
}
