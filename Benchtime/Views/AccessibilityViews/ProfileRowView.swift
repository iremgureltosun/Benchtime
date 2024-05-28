//
//  ProfileRowView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 28.05.2024.
//

import SwiftUI

struct ProfileRowView: View {
    @Environment(\.sizeCategory) var sizeCategory
    let icon: Image?
    let title: String, field: String

    init(icon: Image? = nil, title: String, field: String) {
        self.icon = icon
        self.title = title
        self.field = field
    }

    var body: some View {
        if sizeCategory < ConstantSizeCategory.limit {
            mediumRowView
        } else {
            largeRowView
        }
    }

    @ViewBuilder private var mediumRowView: some View {
        HStack {
            if let icon = icon {
                icon
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 15, height: 15)
            }
            Text(title)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.black)

            Text(field)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.gray)
        }
    }

    @ViewBuilder private var largeRowView: some View {
        VStack(alignment: .center) {
            HStack {
                if let icon = icon {
                    icon
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 15, height: 15)
                }
                Text(title)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.black)
            }
            Text(field)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ProfileRowView(title: "Home town", field: "unknown")
}
