//
//  StableModifier.swift
//  Benchtime
//
//  Created by İrem TOSUN on 28.08.2024.
//

import SwiftUI

struct PlaceholderOnTopWhenFilledModifier: ViewModifier {
    @Binding var contentModel: PillFieldContentModel
    @FocusState private var isFocused: Bool

    func body(content: Content) -> some View {
        VStack {
            if contentModel.isTyping {
                microPlaceholder
            }
            ZStack(alignment: .leading) {
                if !contentModel.isTyping {
                    Text(contentModel.placeholderText)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                content
                    .focused($isFocused)
            }
        }
        .padding()
    }

    @ViewBuilder private var microPlaceholder: some View {
        HStack {
            Text(contentModel.placeholderText)
                .font(.caption)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 25)
    }
}

struct PlaceholderAlwaysOnTopModifier: ViewModifier {
    @Binding var contentModel: PillFieldContentModel
    @FocusState private var isFocused: Bool

    func body(content: Content) -> some View {
        VStack {
            microPlaceholder
            content
                .focused($isFocused)
        }
        .padding()
    }

    @ViewBuilder private var microPlaceholder: some View {
        HStack {
            Text(contentModel.placeholderText)
                .font(.caption)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 25)
    }
}

struct StableModifier: ViewModifier {
    @Binding var contentModel: PillFieldContentModel
    @FocusState private var isFocused: Bool

    func body(content: Content) -> some View {
        content
            .focused($isFocused)
            .font(.subheadline)
            .padding()
    }
}
