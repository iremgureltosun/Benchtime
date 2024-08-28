//
//  PillfieldContentBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.08.2024.
//

import SwiftUI

struct PillFieldContentBuilder {
    
    @Binding private var contentModel: PillFieldContentModel

    init(contentModel: Binding<PillFieldContentModel>) {
        _contentModel = contentModel
    }

    func build() -> some View {
        TextFieldView(contentModel: $contentModel)
    }
}

fileprivate struct TextFieldView: View {
    @FocusState private var isFocused: Bool
    @Binding var contentModel: PillFieldContentModel
    
    init(contentModel: Binding<PillFieldContentModel>) {
        _contentModel = contentModel
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if contentModel.text.isEmpty && !isFocused {
                Text(contentModel.placeholderText)
                    .font(.caption)
                    .foregroundColor(.gray) // Optional: Change placeholder color
            }
            TextField("", text: $contentModel.text)
                .focused($isFocused)
                .font(.subheadline)
        }
        .onChange(of: isFocused) { _, newValue in
            contentModel.isTyping = newValue
        }
    }
}

//struct PillFieldContentModel {
//    var text: String
//    var placeholderText: String
//    var isTyping: Bool
//    
//    init(text: String, placeholderText: String, isTyping: Bool = false) {
//        self.text = text
//        self.placeholderText = placeholderText
//        self.isTyping = isTyping
//    }
//}




