//
//  ImageEditor.swift
//  Benchtime
//
//  Created by Tosun, Irem on 1.07.2024.
//

import Foundation

protocol Editor: CustomStringConvertible {
    associatedtype ContentType
    func apply() throws -> ContentType
}
