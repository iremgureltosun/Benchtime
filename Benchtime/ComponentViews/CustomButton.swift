//
//  CustomButton.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import SwiftUI

struct CustomButton: View {
    private let themeStyle: ThemeStyle 
    private let buttonTitle: String
    private let actionHandler: ()-> Void
    
    init(buttonTitle: String, themeStyle: ThemeStyle = .ocean, actionHandler: @escaping () -> Void) {
        self.buttonTitle = buttonTitle
        self.themeStyle = themeStyle
        self.actionHandler = actionHandler
    }
    
    var body: some View {
        Button {
            actionHandler()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(themeStyle.colorPair.backgroundColor)
                
                Text(buttonTitle)
                    .foregroundColor(themeStyle.colorPair.foregroundColor)
                    .bold()
            }
        }
    }
}
