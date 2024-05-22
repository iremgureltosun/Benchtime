//
//  PlaygroundViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import Observation

@Observable final class PlaygroundViewModel {
    var person: Person = .init(name: "Mary", surname: "Johnson", age: 38, addressText: "23000 St", city: "New york")

    func printPerson() {
        print("Person's name is \(person.name)")
    }
}
