//
//  ListCell.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import SwiftUI

struct ListCell: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.accentColor)

            Spacer()
        }
        .contentShape(Rectangle())
    }
}
