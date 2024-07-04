//
//  DesignPatternsNavigationStrategy.swift
//  Benchtime
//
//  Created by Tosun, Irem on 4.07.2024.
//

import SwiftUI

struct DesignPatternsNavigationStrategy: NavigationStrategy {
    func view(for route: Route) -> some View {
        switch route {
        case .facetedBuilder:
            return AnyView(FacetedBuilderView())
        case .markPhoto: // Chain of responsibility
            return AnyView(MarkPhotoView())
        case .mementoSearchView:
            return AnyView(SearchView())
        case .mementoDoUndo:
            return AnyView(MementoDoUndoView())
        case .decoratorExampleView:
            return AnyView(DecoratorView())
        case .compositeExampleView:
            return AnyView(CompositeTestView())
        case .flyWeightTextEditorView:
            return AnyView(TextEditorFlyWeightView())
        case .flyWeightZooView:
            return AnyView(ZooFlyWeightView())
        default:
            return AnyView(EmptyView())
        }
    }
}
