//
//  ProcessingError.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

enum ProcessingError: Error {
    case resizeError
    case ciImageError
    case filterNotFound
    case filterError
    case watermarkError
}
