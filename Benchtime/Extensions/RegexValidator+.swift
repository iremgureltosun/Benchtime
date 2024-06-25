//
//  RegexValidator.swift
//  Benchtime
//
//  Created by Tosun, Irem on 25.06.2024.
//

import Foundation

extension RegexValidator {
    static let iban = RegexValidator(pattern: "^[A-Z]{2}\\d{2}[A-Z0-9]{1,30}$")
    static let fiveDigitsNumber = RegexValidator(pattern: "^[0-9]{0,5}$")
}
