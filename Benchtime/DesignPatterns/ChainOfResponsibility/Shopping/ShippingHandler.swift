//
//  ShippingHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

final class ShippingHandler: HandlerProtocol {
    typealias T = ShippingModel
    
    var next: ConfirmHandler?
    
    func handle(_ input: inout ShippingModel) throws {
        input.deliveredToPersonName = "Ece Bilgin"
        input.deliveryEndDate = Date()
        
        if input.deliveryEndDate != nil && input.deliveredToPersonName != nil {
            print("Order \(input.order.id) has been shipped.")
            try next?.handle(&input)
        } else {
            print("Order \(input.order.id) shipping failed. Stopping the process.")
        }
    }
}
