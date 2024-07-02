//
//  CompositeListView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import SwiftUI

struct CompositeTestView: View {
    let button1 = AnyComponentView(Button("Button 1") {})
    let button2 = AnyComponentView(Button("Button 2") {})

    let text1 = AnyComponentView(Text("text 1"))
    let text2 = AnyComponentView(Text("text 2"))

    let title = AnyComponentView(Text("title"))
    let subtitle = AnyComponentView(Text("Subtitle"))
    let background = AnyComponentView(Rectangle())

    let theme = ThemeStyle.desert

    var body: some View {
        VStack {
            HeaderComponentView(title: { title }, subtitle: { subtitle }, background: { background }, theme: theme)

            CompositeView(components: [text1, text2, button1, button2], theme: theme)

            Spacer()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    CompositeTestView()
}
