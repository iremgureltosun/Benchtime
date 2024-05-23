//
//  AnimatedButtonView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 23.05.2024.
//

import Combine
import SwiftUI

struct AnimatedButtonView: View {
    @State private var model: AnimationButtonViewModel = .init()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 300)

                vane(geometry)
                    .rotationEffect(Angle(degrees: model.vaneRotationAngle))

                hand(geometry)
                    .rotationEffect(Angle(degrees: model.handRotationAngle))
            }
        }.onChange(of: model.handTimer, initial: false) { _, _ in
            model.rotate(type: .hand, angle: 10)
        }
        .onChange(of: model.vaneTimer, initial: false) { _, _ in
            model.rotate(type: .vane, angle: 10)
        }
        .onAppear {
            model.startTimers()
            // Buggy field that moves the vane with a wrong angle
            withAnimation(.easeInOut(duration: 1).delay(4).repeatForever(autoreverses: false)) {
                model.rotate(type: .vane, angle: -20)
            }
        }
        .onDisappear {
            model.stopTimers()
        }
    }

    @ViewBuilder private func vane(_ geometry: GeometryProxy) -> some View {
        Path { path in
            path.move(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
            path.addLine(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2 - 130))
        }
        .stroke(Color.blue, lineWidth: 2)
    }

    @ViewBuilder private func hand(_ geometry: GeometryProxy) -> some View {
        Path { path in
            path.move(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
            path.addLine(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2 - 100))
        }
        .stroke(Color.red, lineWidth: 4)
    }
}

#Preview {
    AnimatedButtonView()
}
