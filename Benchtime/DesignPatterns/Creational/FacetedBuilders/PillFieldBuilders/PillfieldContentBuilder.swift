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

fileprivate struct TextFieldView: View {
    @FocusState private var isFocused: Bool
    @Binding var contentModel: PillFieldContentModel
    private let behaviourType: PillfieldBehaviourType

    init(contentModel: Binding<PillFieldContentModel>, behaviourType: PillfieldBehaviourType) {
        _contentModel = contentModel
        self.behaviourType = behaviourType
    }

    var body: some View {
        displayInputArea
            .onChange(of: isFocused) { _, newValue in
                contentModel.isTyping = newValue
            }
    }

    @ViewBuilder private var displayInputArea: some View {
        VStack {
            switch behaviourType {
            case .placeholderOnTopWhenFilled:
                if contentModel.isTyping {
                    microPlaceholder
                }
                ZStack(alignment: .leading) {
                    if !contentModel.isTyping {
                        Text(contentModel.placeholderText)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $contentModel.text)
                        .focused($isFocused)
                        .font(.subheadline)
                }
            case .placeHolderAlwaysOnTop:

                microPlaceholder

                TextField("", text: $contentModel.text)
                    .focused($isFocused)
                    .font(.subheadline)

            case .stable:

                TextField(contentModel.placeholderText, text: $contentModel.text)
                    .focused($isFocused)
                    .font(.subheadline)
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
