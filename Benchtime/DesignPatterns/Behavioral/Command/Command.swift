//
//  Command.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import Foundation

protocol Command {
    func execute()
    func undo()
}
