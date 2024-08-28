//
//  SeacrhView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.06.2024.
//

import SwiftUI
import UIKit

struct SearchView: View {
    // Example usage with a seearch editor
    @State private var viewModel = SearchViewModel.shared
    @State private var showList: Bool = true
    var body: some View {
        VStack {
            PillFieldBuilder(contentBuilder: PillFieldContentBuilder(text: $viewModel.searchText, placeholderText: "Type your search"),
                             appearanceModifier: PillFieldAppearanceModifier(iconsType: .withTrailingIcon(Image(systemName: "chevron.down")) ,themeStyle: .desert),
                             validationModifier: nil)
            .build()

            if viewModel.list.count > 0 && !viewModel.searchText.isEmpty && showList {
                VStack {
                    searchHistoryRemoveAllButton

                    List(viewModel.list, id: \.self) { searchedText in

                        getMementoCell(searchedText)
                            .frame(height: 50)
                            .background(Color.white) // White background for each cell
                            .cornerRadius(8) // Optional: Add some rounding for aesthetics
                            .listRowBackground(Color.clear) // Make list row background clear
                            .listRowSeparator(.hidden, edges: /*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/) // Remove divider from cells
                            .onTapGesture {
                                showList = false
                                viewModel.searchText = searchedText
                            }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
                .background(.clear)
            }

            Spacer()
        }
        .background(.blue)
    }

    @ViewBuilder private var searchHistoryRemoveAllButton: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .modifier(ToolTipModifier(tooltip: "Close search history"))
                .padding(.trailing, Constants.Spaces.mediumSpace)
                .onTapGesture {
                    showList = false
                }
            Spacer()

            Image(systemName: "trash.circle")
                .modifier(ToolTipModifier(tooltip: "Remove all history"))
                .padding(.trailing, Constants.Spaces.mediumSpace)
                .onTapGesture {
                    viewModel.removeAllMementos()
                }
        }
    }

    @ViewBuilder private func getMementoCell(_ searchedText: String) -> some View {
        HStack {
            Text(searchedText)
                .padding()
            Spacer()

            Image(systemName: "trash.circle")
                .padding(.trailing, Constants.Spaces.mediumSpace)
                .onTapGesture {
                    viewModel.removeMemento(named: searchedText)
                }
        }
    }
}

#Preview {
    SearchView()
}
