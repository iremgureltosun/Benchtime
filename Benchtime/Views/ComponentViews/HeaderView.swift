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
    
    private var angle: Angle {
        Angle(degrees: themeStyle.degree)
    }
    
    init(themeStyle: ThemeStyle, title: String, subtitle: String) {
        self.themeStyle = themeStyle
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(themeStyle.colorPair.backgroundColor)
                .rotationEffect(angle)

            VStack {
                Spacer()
                    .frame(height: 10)
                
                Text(title)
                    .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(themeStyle.colorPair.foregroundColor)

                Text(subtitle)
                    .foregroundColor(themeStyle.colorPair.foregroundColor)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 200)
    }
}

#Preview {
    HeaderView(themeStyle: .desert, title: "Sample header", subtitle: "Sample subtitle")
}
