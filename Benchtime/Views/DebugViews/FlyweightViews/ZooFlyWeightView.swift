//
//  ZooFlyWeightView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

struct ZooFlyWeightView: View {
    @State private var animals = [Animal]()
    @State private var numMonkey: Double = 10
    @State private var numLion: Double = 6
    @State private var numZebra: Double = 8
    @State private var numElephant: Double = 3
    @State private var numGiraffe: Double = 5

    private let listItems: [GridItem] = Array(repeating: .init(.fixed(CGFloat(80))), count: 4)

    var body: some View {
        VStack {
            HStack {
                Text("Enter monkey number")
                NumericTextFieldBuilder(placeholder: "", value: $numMonkey)
                    .build()
            }
            HStack {
                Text("Enter lion number")
                NumericTextFieldBuilder(placeholder: "", value: $numLion)
                    .build()
            }
            HStack {
                Text("Enter zebra number")
                NumericTextFieldBuilder(placeholder: "", value: $numZebra)
                    .build()
            }
            HStack {
                Text("Enter elephant number")
                NumericTextFieldBuilder(placeholder: "", value: $numElephant)
                    .build()
            }
            HStack {
                Text("Enter giraffe number")
                NumericTextFieldBuilder(placeholder: "", value: $numGiraffe)
                    .build()
            }

            CustomButton(buttonTitle: "Generate") {
                addAnimals()
            }
            .frame(height: 50)

            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: listItems) {
                    ForEach(animals, id: \.id) { animal in
                        let appearence = AppearanceFactory.getAppearance(for: animal.animalType)
                        AnimalCell(appearence)
                    }
                }
            }
            .padding()
        }
        .padding(.horizontal, Constants.Spaces.mediumSpace)
    }

    private func addAnimals() {
        animals = []
        if numMonkey != 0 {
            addAnimal(type: .monkey, Int(numMonkey))
        }

        if numLion != 0 {
            addAnimal(type: .lion, Int(numLion))
        }

        if numZebra != 0 {
            addAnimal(type: .zebra, Int(numZebra))
        }
        if numElephant != 0 {
            addAnimal(type: .elephant, Int(numElephant))
        }
        if numGiraffe != 0 {
            addAnimal(type: .giraffe, Int(numGiraffe))
        }

        animals.shuffle()
    }

    private func addAnimal(type animalType: AnimalType, _ num: Int) {
        let animal = Animal(animalType: animalType, name: "Not mentioned", age: 10)
        let animalArray = [Animal](repeating: animal, count: num)
        animals.append(contentsOf: animalArray)
    }
}

#Preview {
    ZooFlyWeightView()
}
