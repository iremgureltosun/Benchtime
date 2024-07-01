//
//  ValidationHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

final class CheckInventoryHandler: HandlerProtocol {
    typealias T = OrderModel

    var next: PaymentHandler?

    func handle(_ input: inout OrderModel) throws {
        if input.inventorySuccess {
            print("Inventory has been checked. Order \(input.id) is valid.")
            try next?.handle(&input)
        } else {
            print("Order \(input.id) is invalid. Stopping the process.")
        }
    }
}
