//
//  Order.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

struct Order {
    let id: String
    var isValid: Bool = false
    private (set) var isPaid: Bool = false
    private (set) var isShipped: Bool = false
    
    mutating func checkoutPayment(){
        isPaid = true
    }
    
    mutating func shiptPayment(){
        isShipped = true
    }
}
