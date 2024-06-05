//
//  EnvironmentVales+.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import SwiftUI

extension EnvironmentValues {
    var appManager: ApplicationManager {
        get { self[AppKey.self] }
        set { self[AppKey.self] = newValue }
    }
    var detailService: CharacterDetailService {
        get { self[CharacterDetailKey.self] }
        set { self[CharacterDetailKey.self] = newValue }
    }
}

private struct AppKey: EnvironmentKey {
    static var defaultValue: ApplicationManager = ApplicationManager.shared
}

private struct CharacterDetailKey: EnvironmentKey {
    static var defaultValue: CharacterDetailService = CharacterDetailServiceImpl.init()
}
