//
//  MementoDoUndoViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 28.06.2024.
//

import Observation
import SwiftUI

@Observable final class MementoDoUndoViewModel {
    let originator = Originator(initialState: Drawing?.none)
    let careTaker = CareTaker<Drawing>()

    var newDrawing: Drawing?
    private(set) var list: [Drawing] = []

    func saveMemento() {
        guard let newDrawing = newDrawing else { return }

        originator.setState(newDrawing)
        careTaker.save(Memento(state: newDrawing))

        updateList()
    }

    private func updateList() {
        guard careTaker.currentIndex >= 0 else { return }

        list = careTaker.mementos.enumerated()
            .filter { $0.offset <= careTaker.currentIndex }
            .map { $0.element.state }
    }

    func undo() {
        careTaker.undo()
        updateList()
    }

    func redo() {
        careTaker.redo()
        updateList()
    }

    func removeAllMementos() {
        careTaker.removeAll()
        updateList()
    }
}

struct Drawing: Identifiable, Equatable {
    var id = UUID()
    var path: Path
    var color: Color
    var lineWidth: CGFloat
}
