//
//  Observer.swift
//  Benchtime
//
//  Created by Tosun, Irem on 4.07.2024.
//

import Foundation
/// The Observer protocol declares the update method, used by subjects.
protocol Observer: AnyObject {

    func update(subject: Subject)
}

/// The Subject owns some important state and notifies observers when the state
/// changes.
final class Subject {

    /// For the sake of simplicity, the Subject's state, essential to all
    /// subscribers, is stored in this variable.
    var state: Int = { return Int(arc4random_uniform(10)) }()

    /// @var array List of subscribers. In real life, the list of subscribers
    /// can be stored more comprehensively (categorized by event type, etc.).
    private lazy var observers = [Observer]()

    /// The subscription management methods.
    func attach(_ observer: Observer) {
        print("Subject: Attached an observer.\n")
        observers.append(observer)
    }

    func detach(_ observer: Observer) {
        if let idx = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: idx)
            print("Subject: Detached an observer.\n")
        }
    }

    /// Trigger an update in each subscriber.
    func notify() {
        print("Subject: Notifying observers...\n")
        observers.forEach({ $0.update(subject: self)})
    }

    /// Usually, the subscription logic is only a fraction of what a Subject can
    /// really do. Subjects commonly hold some important business logic, that
    /// triggers a notification method whenever something important is about to
    /// happen (or after it).
    func someBusinessLogic() {
        print("\nSubject: I'm doing something important.\n")
        state = Int(arc4random_uniform(10))
        print("Subject: My state has just changed to: \(state)\n")
        notify()
    }
}
