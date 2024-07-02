//
//  CompositeView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import SwiftUI

struct CompositeView: View {
    var components: [AnyComponentView]
    let theme: Theme

    var body: some View {
        VStack {
            ForEach(components.indices, id: \.self) { index in
                components[index].applyTheme(theme)
            }
        }
        
    }
}
