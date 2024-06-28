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

    var searchText = ""

    let originator = Originator(initialState: "")
    let careTaker = CareTaker<String>()

    var list: [String] = [] // Computed properties are not re-rendered in Observation

    func saveMementoIfNotExists() {
        if !list.contains(where: { $0 == searchText }) {
            originator.setState(searchText)
            careTaker.save(Memento(state: searchText))
        }
        list = careTaker.mementos.map { $0.state }
    }

    func removeMemento(named mementoValue: String) {
        if let memento = careTaker.mementos.first(where: { $0.state == mementoValue }) {
            careTaker.removeAll()
            list = careTaker.mementos.map { $0.state }
        }
    }

    func removeAllMementos() {
        careTaker.removeAll()
        list = careTaker.mementos.map { $0.state }
    }
}
