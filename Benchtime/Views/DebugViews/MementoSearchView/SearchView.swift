//
//  SeacrhView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    // Example usage with a seearch editor
    let originator = Originator(initialState: "")
    let caretaker = Caretaker<String>()

    var body: some View {
        PillFieldBuilder(text: $searchText, placeholderText: "Type your search", type: .searchIcon, themeStyle: .desert, buttonHandler: {
            // Initial write
            originator.setState(searchText)
            caretaker.save(originator.createMemento())
        })
        .build()
    }
}

#Preview {
    SearchView()
}
