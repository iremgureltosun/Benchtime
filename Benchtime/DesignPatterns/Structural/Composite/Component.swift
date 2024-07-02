//
//  Component.swift
//  Benchtime
//
//  Created by Tosun, Irem on 1.07.2024.
//

import SwiftUI

// Protocol for components
protocol Component: View {
    associatedtype Content: View
    func applyTheme(_ theme: Theme) -> Content
}

struct AnyComponentView: View {
    private let _applyTheme: (Theme) -> AnyView

    init<T: Component>(_ component: T) {
        _applyTheme = { theme in
            AnyView(component.applyTheme(theme))
        }
    }

    func applyTheme(_ theme: Theme) -> some View {
        _applyTheme(theme)
    }

    var body: some View {
        applyTheme(ThemeStyle.ocean) // Default theme or pass in a theme as needed
    }
}
