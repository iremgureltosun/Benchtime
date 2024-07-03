//
//  Pet.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import Foundation

enum AnimalType: String {
    case lion
    case giraffe
    case elephant
    case monkey
    case zebra
}

struct Animal: Hashable {
    let animalType: AnimalType
    let name: String
    let age: Int
    var id: String { UUID().uuidString }
}
