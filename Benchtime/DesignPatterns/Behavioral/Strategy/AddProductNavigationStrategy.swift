//
//  AddProductNavigationStrategy.swift
//  Benchtime
//
//  Created by Tosun, Irem on 4.07.2024.
//

import SwiftUI

struct AddProductNavigationStrategy: NavigationStrategy {
    func view(for route: Route) -> some View {
        switch route {
        case .addProduct:
            return AnyView(AddProductView())
        default:
            return AnyView(EmptyView())
        }
    }
}
