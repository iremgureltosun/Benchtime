//
//  CommandInvoker.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import Foundation

final class CommandInvoker {
    private var commandHistory: [Command] = []
    private var undoStack: [Command] = []

    func executeCommand(_ command: Command) {
        command.execute()
        commandHistory.append(command)
        undoStack.removeAll()
    }

    func undo() {
        guard let command = commandHistory.popLast() else { return }
        command.undo()
        undoStack.append(command)
    }

    func redo() {
        guard let command = undoStack.popLast() else { return }
        command.execute()
        commandHistory.append(command)
    }
}
