//
//  AnimatedTextView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 27.05.2024.
//

import SwiftUI

struct AnimatedTextView: View {
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 0.5
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 4)
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.5).repeatCount(1, autoreverses: true)) {
                    self.scale = 1.2
                    self.opacity = 1.0
                }
            }
    }
}



#Preview {
    AnimatedTextView(title: "EPISODES")
}
