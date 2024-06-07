//
//  MockPaymentProcessor.swift
//  Benchtime
//
//  Created by Tosun, Irem on 6.06.2024.
//

import Foundation

protocol PaymentProcessor {
    var processedInfo: (any CardInfo)? { get }
    func setupTransactionId(_ id: Int)
    func processPayment(_ info: any CardInfo) -> Int?
}

// Let's say you have a mock service that is implemented
class MockPaymentProcessor: PaymentProcessor {
    var transcationId: Int = 0
    var processedInfo: (any CardInfo)?

    func setupTransactionId(_ id: Int) {
        transcationId = id
    }

    func processPayment(_ info: any CardInfo) -> Int? {
        processedInfo = info
        return transcationId
    }
}
