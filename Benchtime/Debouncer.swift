//
//  CharactersViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//
import Foundation

actor Debouncer {
    private let duration: Duration
    private var isPending = false

    init(duration: Duration) {
        self.duration = duration
    }

    func sleep() async -> Bool {
        if isPending { return false }
        isPending = true
        try? await Task.sleep(for: duration)
        isPending = false
        return true
    }
}

extension CharacterStatus: Identifiable {
    var id: String { rawValue }
}

extension CharacterGender: Identifiable {
    var id: String { rawValue }
}
