//
//  TextEditorFlyWeightView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

struct TextEditorFlyWeightView: View {
    var body: some View {
        let factory = CharacterStyleFactory()

        let style1 = factory.getStyle(font: .body, color: .black, size: 12)
        let style2 = factory.getStyle(font: .title, color: .blue, size: 14)
        let style3 = factory.getStyle(font: .title, color: .green, size: 16)
        let style4 = factory.getStyle(font: .title, color: .brown, size: 18)
        let style5 = factory.getStyle(font: .title, color: .red, size: 20)

        let text = "Hello is displayed with style"
        VStack {
            StyledText(value: "\(text) 1", style: style1).display()
            StyledText(value: "\(text) 2", style: style2).display()
            StyledText(value: "\(text) 3", style: style3).display()
            StyledText(value: "\(text) 4", style: style4).display()
            StyledText(value: "\(text) 5", style: style5).display()
        }
    }
}

#Preview {
    TextEditorFlyWeightView()
}
