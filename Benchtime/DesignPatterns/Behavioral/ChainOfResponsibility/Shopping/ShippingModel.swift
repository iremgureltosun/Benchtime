//
//  Shipping.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import Foundation

struct ShippingModel {
    var order: OrderModel
    let deliveryAddress: String
    let postalCode: String
    let cityName: String
    var deliveredToPersonName: String?
    let deliveryStartDate: Date
    var deliveryEndDate: Date?
}
