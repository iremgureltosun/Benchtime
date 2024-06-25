//
//  ApplicationManager.swift
//  Benchtime
//
//  Created by Tosun, Irem on 22.05.2024.
//

import Foundation

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
    var errorWrapper: ErrorWrapper?
    static let shared = ApplicationManager()

    private init() {
        routes = []
        errorWrapper = nil
    }

    func navigate(to route: Route) {
        routes.append(route)
    }
}

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    var guidance: String = ""
}
