//
//  PlaygroundViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//
import Foundation
import Observation

@Observable final class TitlePlaygroundViewModel {
    var person: Person = .init(name: "Mary", surname: "Johnson", age: 38, gender: .female, addressText: "23000 St", city: "New york")
    var displayName: String = ""

    func printPerson() {
        print("Person's gender is \(person.gender)")
        print("Person's name is \(person.name)")
        print("Person's surname is \(person.surname)")
        displayName = person.displayName()
        print("Title of person --> \(displayName)")
    }
}

extension Person {
    func displayName() -> String {
        var moderatedName = ""
        let nameComponents = name.components(separatedBy: " ")
        if !nameComponents.isEmpty {
            for (index, component) in nameComponents.enumerated() {
                if index < nameComponents.count - 1 {
                    if let firstLetter = component.first {
                        moderatedName += "\(firstLetter).".uppercased()
                    }
                } else {
                    moderatedName += component.capitalized
                }
            }
        }
        if let genderTitle = gender.shortTitle {
            moderatedName = "(\(genderTitle)) " + moderatedName
        }
        moderatedName += " \(surname.uppercased())"
        return moderatedName
    }
}

extension CharacterFilterCriteria {
    static func createSearchURL(from filters: [CharacterFilterCriteria]) -> URL? {
        return nil
    }
}

private extension CharacterGender {
    var shortTitle: String? {
        switch self {
        case .male: return "He/His"
        case .female: return "She/Her"
        case .genderless: return "They/Their"
        case .unknown: return nil
        }
    }
}
