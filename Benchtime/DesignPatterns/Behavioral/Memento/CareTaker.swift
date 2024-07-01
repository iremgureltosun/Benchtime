//
//  Caretaker.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import Foundation

/// The Caretaker class will manage mementos of any type.
final class CareTaker<T> where T: Equatable {
    private(set) var mementos: [Memento<T>] = []
    private(set) var currentIndex: Int = -1

    func save(_ memento: Memento<T>) {
        if currentIndex < mementos.count - 1 {
            mementos = Array(mementos.prefix(currentIndex + 1))
        }
        mementos.append(memento)
        currentIndex += 1
    }

    @discardableResult
    func undo() -> Memento<T>? {
        guard currentIndex > 0 else { return nil }
        currentIndex -= 1
        return mementos[currentIndex]
    }

    @discardableResult
    func redo() -> Memento<T>? {
        guard currentIndex < mementos.count - 1 else { return nil }
        currentIndex += 1
        return mementos[currentIndex]
    }


    func removeAll() {
        mementos.removeAll()
        currentIndex = -1
    }
}
