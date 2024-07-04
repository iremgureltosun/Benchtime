//
//  File.swift
//  Benchtime
//
//  Created by Tosun, Irem on 4.07.2024.
//

import SwiftUI

struct CharacterDetailNavigationStrategy: NavigationStrategy {
    func view(for route: Route) -> some View {
        switch route {
        case let .characterDetail(id):
            return AnyView(CharacterDetailView(id: id))
        default:
            return AnyView(EmptyView())
        }
    }
}
