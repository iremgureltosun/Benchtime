//
//  String+.swift
//  Benchtime
//
//  Created by Tosun, Irem on 10.06.2024.
//

import Foundation

extension String {
    func convertISO8601ToDate() -> Date? {
        return try? Date(self, strategy: .iso8601)
    }
}
