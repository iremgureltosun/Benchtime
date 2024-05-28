//
//  ProfileTitleRowView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 28.05.2024.
//

import SwiftUI

struct ProfileTitleRowView: View {
    let status: CharacterStatus
    let text: String, field: String

    var body: some View {
        VStack(spacing: 0) {
            Text(text)
                .foregroundColor(.gray)
                .font(.caption)
            
            HStack(alignment: .center) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundColor(status.color)
                    .frame(width: 15, height: 15)

                Text(field)
                    .font(.body)
            }
            
        }
    }
}

#Preview {
    ProfileTitleRowView(status: .alive, text: "Morty Smith", field: "*")
}
