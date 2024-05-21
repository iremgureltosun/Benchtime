//
//  SearchTextfield.swift
//  Benchtime
//
//  Created by Tosun, Irem on 21.05.2024.
//

import SwiftUI

struct SearchTextfield: View {
    @Binding private var searchText: String
    
    init(searchText: Binding<String>) {
        _searchText = searchText
    }

    var body: some View {
            TextField("Search", text: $searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                )
    }
}

#Preview {
    SearchTextfield(searchText: .constant(""))
}
