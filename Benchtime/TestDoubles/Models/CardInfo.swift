//
//  Product.swift
//  Benchtime
//
//  Created by Tosun, Irem on 6.06.2024.
//

import Foundation

protocol CardInfo: Equatable {
}

struct DummyCardInfo: CardInfo {
    let cardNumber: String
    let cardHolder: String
    let expiryDate: Date
    let cvv: String

    init(cardNumber: String, cardHolder: String, expiryDate: Date, cvv: String) {
        self.cardNumber = cardNumber
        self.cardHolder = cardHolder
        self.expiryDate = expiryDate
        self.cvv = cvv
    }

    // Equatable conformance
    static func == (lhs: DummyCardInfo, rhs: DummyCardInfo) -> Bool {
        return lhs.cardNumber == rhs.cardNumber &&
            lhs.cardHolder == rhs.cardHolder &&
            lhs.expiryDate == rhs.expiryDate &&
            lhs.cvv == rhs.cvv
    }
}
