//
//  HeaderComponent.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import SwiftUI

struct HeaderComponentView<Title: Component, Subtitle: Component, Background: Component>: View {
    let title: Title
    let subtitle: Subtitle
    let background: Background
    let theme: Theme

    init(@ViewBuilder title: () -> Title,
         @ViewBuilder subtitle: () -> Subtitle,
         @ViewBuilder background: () -> Background,
         theme: Theme) {
        self.title = title()
        self.subtitle = subtitle()
        self.background = background()
        self.theme = theme
    }

    var body: some View {
        ZStack {
            AnyComponentView(background)
                .applyTheme(theme)
                .rotationEffect(Angle(degrees: 15))

            VStack {
                Spacer()
                    .frame(height: 10)

                Group {
                    AnyComponentView(title)
                        .applyTheme(theme)
                        .font(.title)

                    AnyComponentView(subtitle)
                        .applyTheme(theme)
                        .font(.subheadline)
                        .lineLimit(2)
                }
                .padding(.horizontal, Constants.Spaces.mediumSpace)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 200)
    }
}
