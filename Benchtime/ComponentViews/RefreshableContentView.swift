//
//  SwiftUIView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 21.05.2024.
//

import SwiftUI

enum RefreshablePresentModel {
    static let homeScrollView: String = "home-scroll"
}

struct RefreshableContentView<Content: View>: View {
    private let content: () -> Content
    @Environment(\.refresh) private var refresh
    @Binding private var isRefreshing: Bool

    init(isRefreshing: Binding<Bool>, content: @escaping () -> Content) {
        _isRefreshing = isRefreshing
        self.content = content
    }

    var body: some View {
        VStack(spacing: 20) {
            if isRefreshing {
                LoadingAnimationView()
            } else {
                ShowMorelndicatorView()
            }
            content()
        }
        .animation(.default, value: isRefreshing)
        .background(
            GeometryReader { proxy in
                let offset = proxy.frame(in: .named(RefreshablePresentModel.homeScrollView)).minY
                Color.clear.preference(key: ViewOffsetKey.self, value: offset)
            }
        )
        .onPreferenceChange(ViewOffsetKey.self) {
            if $0 > 0, !isRefreshing {
                isRefreshing = true
                Task {
                    await refresh?()
                    await MainActor.run {
                        isRefreshing = false
                    }
                }
            }
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
