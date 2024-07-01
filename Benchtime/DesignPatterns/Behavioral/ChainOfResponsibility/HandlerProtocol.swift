//
//  OrderHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

protocol HandlerProtocol {
    associatedtype T
    func handle(_ input: inout T) throws
}

