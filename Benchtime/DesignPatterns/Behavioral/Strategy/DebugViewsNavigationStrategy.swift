//
//  DebugViewsNavigationStrategy.swift
//  Benchtime
//
//  Created by Tosun, Irem on 4.07.2024.
//

import SwiftUI

struct DebugViewsNavigationStrategy: NavigationStrategy {
    func view(for route: Route) -> some View {
        switch route {
        case .animatedClock:
            return AnyView(AnimatedClockView())
        case .titlePlayground:
            return AnyView(TitlePlaygroundView())
        default:
            return AnyView(EmptyView())
        }
    }
}
