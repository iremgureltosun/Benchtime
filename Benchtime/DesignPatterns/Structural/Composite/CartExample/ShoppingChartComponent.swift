//
//  ShoppingChartComonent.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import Foundation

protocol ShoppingCartComponent {
    var price: Double { get }
    func getPrice() -> Double
}
