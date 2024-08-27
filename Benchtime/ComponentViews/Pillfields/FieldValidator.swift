//
//  FieldValidator.swift
//  Benchtime
//
//  Created by Tosun, Irem on 25.06.2024.
//

import Foundation
import Observation

@Observable final class FieldValidator {
    let validator: RegexValidator

   // var value: String

    init(validator: RegexValidator, _ value: String) {
        self.validator = validator
        self.value = value
    }
}

struct RegexValidator {
    let pattern: String

    func validate(_ input: String) -> Bool {
        let trimmedInput = input.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
        guard !trimmedInput.isEmpty else { return true }

        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: trimmedInput.utf16.count)
        return regex.firstMatch(in: trimmedInput, options: [], range: range) != nil
    }
}
