//
//  AppearenceFactory.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

class AppearanceFactory {
    private static var cache = [AnimalType: Appearance]()

    static func getAppearance(for key: AnimalType) -> Appearance {
        if let value = cache[key] {
            print("AppearanceFactory: Reusing an existing \(key.rawValue)-appearance.")
            return value
        } else {
            print("AppearanceFactory: Can't find a cached \(key.rawValue)-object, creating a new one.")

            var appearence = Appearance(image: Image(key.rawValue))

            switch key {
            case .elephant:
                appearence.setColor(.yellow)
            case .giraffe:
                appearence.setColor(.green)
            case .lion:
                appearence.setColor(.gray)
            case .zebra:
                appearence.setColor(.black)
            case .monkey:
                appearence.setColor(.red)
            }
            cache[key] = appearence

            return cache[key] ?? Appearance(image: Image(systemName: "hare"))
        }
    }
}
