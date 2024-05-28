//
//  ProfileTitleRowView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 28.05.2024.
//

import SwiftUI

struct ProfileTitleRowView: View {
    @Environment(\.sizeCategory) var sizeCategory
    let figure: Figure

    var body: some View {
        if sizeCategory > ConstantSizeCategory.limit {
            VStack(spacing: 0) {
                Text(figure.gender.genderIconName)
                    .font(.body)

                HStack(alignment: .center) {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(figure.status.color)
                        .frame(width: 15, height: 15)

                    Text(figure.name)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            .padding(.bottom, 30)
        } else {
            HStack {
                Text(figure.gender.genderIconName)
                    .font(.body)

                HStack(alignment: .center) {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(figure.status.color)
                        .frame(width: 15, height: 15)

                    Text(figure.name)
                        .foregroundColor(.gray)
                        .font(.body)
                }
            }
        }
    }
}
