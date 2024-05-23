//
//  AnimatedButtonView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 23.05.2024.
//

import SwiftUI

struct AnimatedButtonView: View {
    @State private var vaneRotationAngle: CGFloat = 0
    @State private var handRotationAngle: CGFloat = 0

    private let timerVane = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let timerHand = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 300)

                vane(geometry)
                    .rotationEffect(Angle(degrees: vaneRotationAngle))

                hand(geometry)
                    .rotationEffect(Angle(degrees: handRotationAngle))
            }
        }
        .onReceive(timerVane, perform: { _ in
            vaneRotationAngle += 10
        })
        .onReceive(timerHand, perform: { _ in
            handRotationAngle += 10
        })
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
