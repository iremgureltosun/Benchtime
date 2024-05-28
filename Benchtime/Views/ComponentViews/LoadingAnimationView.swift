//
//  LoadingAnimationView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 21.05.2024.
//

import SwiftUI

struct LoadingAnimationView: View {
    @State private var opacity1 = 0.0
    @State private var opacity2 = 0.0
    @State private var opacity3 = 0.0

    var body: some View {
        HStack {
            CustomCircleView()
                .opacity(opacity1)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 2)
                        .repeatForever(autoreverses: true)) {
                            self.opacity1 = 1.0
                        }
                }

            CustomCircleView()
                .opacity(opacity2)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1.5).delay(0.5)
                        .repeatForever(autoreverses: true)) {
                            self.opacity2 = 1.0
                        }
                }

            CustomCircleView()
                .opacity(opacity3)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1).delay(1)
                        .repeatForever(autoreverses: true)) {
                            self.opacity3 = 1.0
                        }
                }
        }
    }
}

#Preview {
    LoadingAnimationView()
}
