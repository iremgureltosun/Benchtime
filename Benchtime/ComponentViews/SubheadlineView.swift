//
//  SubheadlineView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 23.05.2024.
//

import SwiftUI

struct SubheadlineView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.accentColor)

            Spacer()
        }
    }
}

#Preview {
    SubheadlineView(title: "Hello")
}
