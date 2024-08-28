//
//  SearchViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 28.06.2024.
//

import Foundation
import Observation

@Observable final class SearchViewModel {
    static let shared = SearchViewModel()
    private init() {}

    var searchContentModel = PillFieldContentModel(text: "", placeholderText: "Enter a word to search for")

    let originator = Originator(initialState: "")
    let careTaker = CareTaker<String>()

    var list: [String] = [] // Computed properties are not re-rendered in Observation

    func saveMementoIfNotExists() {
        if !list.contains(where: { $0 == searchContentModel.text }) {
            originator.setState(searchContentModel.text)
            careTaker.save(Memento(state: searchContentModel.text))
        }
        list = careTaker.mementos.map { $0.state }
    }

    func removeMemento(named mementoValue: String) {
        if let _ = careTaker.mementos.first(where: { $0.state == mementoValue }) {
            careTaker.removeAll()
            list = careTaker.mementos.map { $0.state }
        }
    }

    func removeAllMementos() {
        careTaker.removeAll()
        list = careTaker.mementos.map { $0.state }
    }
}
