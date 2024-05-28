//
//  ActivityIndicator.swift
//  Benchtime
//
//  Created by Tosun, Irem on 21.05.2024.
//

import SwiftUI

struct ShowMorelndicatorView: View {

    var body: some View {
        HStack {
            CustomCircleView()

            CustomCircleView()
            
            CustomCircleView()
            
        }
    }
}

struct CustomCircleView: View {
    private let circleRadius: CGFloat = 10
    private let circleColor: Color = .black
    var body: some View {
        Circle()
            .foregroundColor(circleColor)
            .frame(width: circleRadius, height: circleRadius)
    }
}
