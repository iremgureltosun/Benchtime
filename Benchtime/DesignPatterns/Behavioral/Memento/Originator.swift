//
//  Originator.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import Foundation

/// The Originator class will also be generic, allowing it to create and restore mementos of any type.
final class Originator<T> {
    private(set) var state: T

    init(initialState: T) {
        self.state = initialState
    }

    func setState(_ newState: T) {
        state = newState
    }

    func createMemento() -> Memento<T> {
        return Memento(state: state)
    }

    func restore(from memento: Memento<T>) {
        state = memento.state
    }
}
