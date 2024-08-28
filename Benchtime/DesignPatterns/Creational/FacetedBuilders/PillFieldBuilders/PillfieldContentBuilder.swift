//
//  PillfieldContentBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.08.2024.
//

import SwiftUI

struct PillFieldContentBuilder {
    private let behaviourType: PillfieldBehaviourType
    @Binding private var contentModel: PillFieldContentModel

    init(contentModel: Binding<PillFieldContentModel>, behaviourType: PillfieldBehaviourType = .stable) {
        _contentModel = contentModel
        self.behaviourType = behaviourType
    }

    func build() -> some View {
        TextFieldView(contentModel: $contentModel, behaviourType: behaviourType)
    }
}

import SwiftUI

fileprivate struct TextFieldView: View {
    @FocusState private var isFocused: Bool
    @Binding var contentModel: PillFieldContentModel
    private let behaviourType: PillfieldBehaviourType

    init(contentModel: Binding<PillFieldContentModel>, behaviourType: PillfieldBehaviourType) {
        _contentModel = contentModel
        self.behaviourType = behaviourType
    }

    var body: some View {
        Group {
            switch behaviourType {
            case .placeholderOnTopWhenFilled:
                TextField("", text: $contentModel.text)
                    .modifier(PlaceholderOnTopWhenFilledModifier(contentModel: $contentModel))
            case .placeHolderAlwaysOnTop:
                TextField("", text: $contentModel.text)
                    .modifier(PlaceholderAlwaysOnTopModifier(contentModel: $contentModel))
            case .stable:
                TextField(contentModel.placeholderText, text: $contentModel.text)
                    .modifier(StableModifier(contentModel: $contentModel))
            }
        }
        .focused($isFocused)
        .font(.subheadline)
        .onChange(of: isFocused) { newValue in
            contentModel.isTyping = newValue
        }
    }
}

