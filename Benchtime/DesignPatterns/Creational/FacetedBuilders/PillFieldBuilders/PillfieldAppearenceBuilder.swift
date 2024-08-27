//
//  PillfieldAppearenceBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.08.2024.
//

import Foundation

struct PillFieldAppearanceBuilder {
    private var type: PillFieldType
    private var themeStyle: ThemeStyle

    init(type: PillFieldType, themeStyle: ThemeStyle) {
        self.type = type
        self.themeStyle = themeStyle
    }

    func buildAppearance() -> some View {
        HStack {
            switch type {
            case .custom(let sfSymbolName):
                Image(systemName: sfSymbolName)
            case .rightArrow:
                Image(systemName: "arrow.right.circle")
            }

            Spacer()

            switch themeStyle {
            case .ocean:
                Color.blue
                    .cornerRadius(8)
                    .padding()
            case .desert:
                Color.orange
                    .cornerRadius(8)
                    .padding()
            }
        }
    }
}
