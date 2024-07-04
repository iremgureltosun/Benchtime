//
//  ObserverAImpl.swift
//  Benchtime
//
//  Created by Tosun, Irem on 4.07.2024.
//

import Foundation

/// Concrete Observers react to the updates issued by the Subject they had been
/// attached to.
final class ConcreteObserverA: Observer {
    func update(subject: Subject) {
        if subject.state < 3 {
            print("ConcreteObserverA: Reacted to the event.\n")
        }
    }
}

final class ConcreteObserverB: Observer {
    func update(subject: Subject) {
        if subject.state >= 3 {
            print("ConcreteObserverB: Reacted to the event.\n")
        }
    }
}
