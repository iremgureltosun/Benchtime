//
//  ZooFlyWeightView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

struct ZooFlyWeightView: View {
    @State private var animals = [Animal]()
    @State private var numMonkey: Int = 10
    @State private var numLion: Int = 6
    @State private var numZebra: Int = 8
    @State private var numElephant: Int = 3
    @State private var numGiraffe: Int = 5

    private let listItems: [GridItem] = Array(repeating: .init(.fixed(CGFloat(80))), count: 4)

    var body: some View {
        VStack {
            getRow(placeholder: "Enter monkey number", value: $numMonkey)
            getRow(placeholder: "Enter lion number", value: $numLion)
            getRow(placeholder: "Enter zebra number", value: $numZebra)
            getRow(placeholder: "Enter elephant number", value: $numElephant)
            getRow(placeholder: "Enter giraffe number", value: $numGiraffe)

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

    @ViewBuilder private func getRow(placeholder: String, value: Binding<Int>) -> some View {
        HStack {
            Text(placeholder)
            Spacer()
            NumericTextFieldBuilder(placeholder: "", value: value)
                .build()
                .frame(width: 200)
        }
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
