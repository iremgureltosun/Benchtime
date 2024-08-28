//
//  PillfieldAppearenceBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.08.2024.
//

import SwiftUI

struct PillFieldAppearanceModifier: ViewModifier {
    private var iconsType: PillFieldIconsType
    private var themeStyle: ThemeStyle

    init(iconsType: PillFieldIconsType, themeStyle: ThemeStyle) {
        self.iconsType = iconsType
        self.themeStyle = themeStyle
    }

    func body(content: Content) -> some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(.black, lineWidth: 1)
            .frame(height: 60)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.bar)
            )
            .overlay {
                ZStack(alignment: .leading) {
                    content
                        .padding([.top, .bottom], 8)
                        .padding(.leading, leadingIconExists ? 40 : 12)
                        .padding(.trailing, trailingIconExists ? 40 : 12)

                    iconsView
                }
            }
    }

    private var leadingIconExists: Bool {
        switch iconsType {
        case .withLeadingIcon, .withIconsOnBothSide:
            return true
        default:
            return false
        }
    }

    private var trailingIconExists: Bool {
        switch iconsType {
        case .withTrailingIcon, .withIconsOnBothSide:
            return true
        default:
            return false
        }
    }

    @ViewBuilder private var iconsView: some View {
        switch iconsType {
        case let .withTrailingIcon(icon):
            HStack {
                Spacer()
                icon
                    .padding(.trailing, 10)
                    .foregroundColor(themeStyle.colorCatalog.backgroundColor)
            }
        case let .withLeadingIcon(icon):
            HStack {
                icon
                    .padding(.leading, 10)
                    .foregroundColor(themeStyle.colorCatalog.backgroundColor)
                Spacer()
            }
        case let .withIconsOnBothSide(leadingIcon, trailingIcon):
            HStack {
                Group {
                    leadingIcon
                        .padding(.leading, 10)

                    Spacer()

                    trailingIcon
                        .padding(.trailing, 10)
                }
                .foregroundColor(themeStyle.colorCatalog.backgroundColor)
            }
        }
    }
}
