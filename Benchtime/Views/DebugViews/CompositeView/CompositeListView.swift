//
//  CompositeListView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import SwiftUI

struct CompositeListView: View {
    let button1 = AnyComponentView(Button("Button 1") {})
    let button2 = AnyComponentView(Button("Button 2") {})
    let title = AnyComponentView(Text("title"))
    let subtitle = AnyComponentView(Text("Hello, World!"))
    let background = AnyComponentView(Rectangle())
    
    
    var body: some View {
        VStack {
            // HeaderComponent(title: title, subtitle: subtitle, background: background)
          
            CompositeView(components: [button1, button2], theme: ThemeStyle.desert)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    CompositeListView()
}
