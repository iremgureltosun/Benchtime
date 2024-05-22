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
}

private struct AppKey: EnvironmentKey {
    static var defaultValue: ApplicationManager = ApplicationManager.shared
}
