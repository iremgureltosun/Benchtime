//
//  ApplicationManager.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import SwiftUI

enum LoadingState: Hashable, Identifiable {
    case idle
    case loading(String)

    var id: Self {
        return self
    }
}

@Observable class ApplicationManager {
    var loadingState: LoadingState = .idle
    var routes: [Route]
    private var strategies: [Route: any NavigationStrategy] = [:]

    var errorWrapper: ErrorWrapper?
    static let shared = ApplicationManager()

    private init() {
        routes = []
        errorWrapper = nil
        
        strategies[.addProduct] = AddProductNavigationStrategy()
        strategies[.animatedClock] = DebugViewsNavigationStrategy()
        strategies[.titlePlayground] = DebugViewsNavigationStrategy()
        strategies[.facetedBuilder] = DesignPatternsNavigationStrategy()
        strategies[.markPhoto] = DesignPatternsNavigationStrategy()
        strategies[.mementoSearchView] = DesignPatternsNavigationStrategy()
        strategies[.mementoDoUndo] = DesignPatternsNavigationStrategy()
        strategies[.decoratorExampleView] = DesignPatternsNavigationStrategy()
        strategies[.compositeExampleView] = DesignPatternsNavigationStrategy()
        strategies[.flyWeightTextEditorView] = DesignPatternsNavigationStrategy()
        strategies[.flyWeightZooView] = DesignPatternsNavigationStrategy()
    }

    func navigate(to route: Route) {
        if case let .characterDetail(id) = route {
            strategies[.characterDetail(id: id)] = CharacterDetailNavigationStrategy()
        }
        routes.append(route)
    }

    func view(for route: Route) -> AnyView {
        if let strategy = strategies[route] {
            return strategy.view(for: route) as! AnyView
        }
        return AnyView(EmptyView())
    }
}

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    var guidance: String = ""
}
