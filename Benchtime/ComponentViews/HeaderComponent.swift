//
//  HeaderComponent.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import SwiftUI

struct HeaderComponent<Title: Component, Subtitle: Component, Background: Component>: View {
    let title: Title
    let subtitle: Subtitle
    let background: Background

    init(@ViewBuilder title: () -> Title,
         @ViewBuilder subtitle: () -> Subtitle,
         @ViewBuilder background: () -> Background) {
        self.title = title()
        self.subtitle = subtitle()
        self.background = background()
    }

    var body: some View {
        ZStack {
            background
                .rotationEffect(Angle(degrees: 15))
            
            VStack {
                Spacer()
                    .frame(height: 10)
                
                Group {
                    title
                        .font(.title)
                    
                    subtitle
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

