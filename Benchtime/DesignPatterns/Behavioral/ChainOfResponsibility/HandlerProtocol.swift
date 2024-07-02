//
//  OrderHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

protocol HandlerProtocol: AnyObject {
    associatedtype ContentType

    var next: AnyHandler<ContentType>? { get set }

    func handle(_ input: inout ContentType) throws

    @discardableResult
    func setNext(handler: AnyHandler<ContentType>) -> AnyHandler<ContentType>
}

extension HandlerProtocol {
    func setNext(handler: AnyHandler<ContentType>) -> AnyHandler<ContentType> {
        self.next = handler
        return handler
    }
}

// Type-erased handler to allow chaining different concrete handlers
final class AnyHandler<T>: HandlerProtocol {
    private let _handle: (inout T) throws -> Void
    var next: AnyHandler<T>?

    init<U: HandlerProtocol>(_ handler: U) where U.ContentType == T {
        _handle = handler.handle
        next = handler.next
    }

    func handle(_ input: inout T) throws {
        try _handle(&input)
        try next?.handle(&input)
    }

    @discardableResult
    func setNext(handler: AnyHandler<T>) -> AnyHandler<T> {
        next = handler
        return handler
    }
}
