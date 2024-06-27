//
//  ConfirmHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import Foundation

final class ConfirmHandler: HandlerProtocol {
    typealias T = ShippingModel

    func handle(_ input: inout ShippingModel) throws {
        input.order.confirm()
        if input.order.orderConfirmed {
            print("Order is successfully completed.")
        } else {
            print("Order is not confirmed")
        }
    }
}
