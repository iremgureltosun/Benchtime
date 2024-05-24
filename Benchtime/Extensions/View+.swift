//
//  View.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.05.2024.
//

import Foundation
import SwiftUI

extension View {
    func printOutput(_ value: Any, saying description: String = "") -> Self {
        let message = "\(description) \(value)".trimmingCharacters(in: .whitespaces)
        print(message)
        return self
    }
}
