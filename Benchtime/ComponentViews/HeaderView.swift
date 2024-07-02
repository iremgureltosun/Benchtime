//
//  HeaderView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import SwiftUI

struct HeaderView: View {
    private let themeStyle: ThemeStyle
    private let title: String
    private let subtitle: String
    
    private let angle: Angle = Angle(degrees: 15)
    
    init(themeStyle: ThemeStyle, title: String, subtitle: String) {
        self.themeStyle = themeStyle
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(themeStyle.colorCatalog.backgroundColor)
                .rotationEffect(angle)

            VStack {
                Spacer()
                    .frame(height: 10)
                
                Group {
                    Text(title)
                        .font(.title)
                        .foregroundColor(themeStyle.colorCatalog.textColor)
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .lineLimit(2)
                        .foregroundColor(themeStyle.colorCatalog.textColor)
                }
                .padding(.horizontal, Constants.Spaces.mediumSpace)
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 200)
    }
}

#Preview {
    HeaderView(themeStyle: .desert, title: "Sample header", subtitle: "This is just a fake insertion, you will receive success if it works.")
}
