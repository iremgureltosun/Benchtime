//
//  BenchtimeApp.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import SwiftData
import SwiftUI

@main
struct BenchtimeApp: App {
   
    var body: some Scene {
        WindowGroup {
                MainView()
            }
        }
}

extension EnvironmentValues {
    var appManager: ApplicationManager {
        get { self[AppKey.self] }
        set { self[AppKey.self] = newValue }
    }
}

private struct AppKey: EnvironmentKey {
    static var defaultValue: ApplicationManager = ApplicationManager.shared
}
