//
//  Date+.swift
//  Benchtime
//
//  Created by Tosun, Irem on 10.06.2024.
//

import Foundation

extension Date {
    func dateString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }

    func timeString() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}


