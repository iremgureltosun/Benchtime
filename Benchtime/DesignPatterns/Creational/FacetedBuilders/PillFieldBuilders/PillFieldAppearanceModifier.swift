//
//  PillfieldAppearenceBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.08.2024.
//

import SwiftUI

struct PillFieldAppearanceModifier: ViewModifier {
    private var type: PillFieldType
    private var themeStyle: ThemeStyle

    init(type: PillFieldType, themeStyle: ThemeStyle) {
        self.type = type
        self.themeStyle = themeStyle
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                .font(.headline) // Add custom appearance logic here
           
            HStack {
                Spacer()
                
                icon
                    .tint(themeStyle.colorCatalog.backgroundColor)
                    .padding(.trailing, 10)

            }
        }
    }
    
    @ViewBuilder private var icon: some View {
        switch type {
        case .custom(let sfSymbolName):
            Image(systemName: sfSymbolName)
        case .rightArrow:
            Image(systemName: "chevron.right.circle")
        case.searchIcon:
            Image(systemName: "magnifyingglass.circle")
        case.downArrow:
            Image(systemName: "chevron.down.circle")
        }
    }
}

