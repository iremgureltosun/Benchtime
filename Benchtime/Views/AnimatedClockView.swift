//
//  AnimatedButtonView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 23.05.2024.
//

import Combine
import SwiftUI

struct AnimatedClockView: View {
    @State private var model: AnimationClockViewModel = .init()
    let clockColor = Color.accentColor

    var body: some View {
        //  let _ = Self._printChanges()
        VStack {
            clock
        }
        .onAppear {
            model.startTimers()
            // Buggy field that moves the vane with a wrong angle
            withAnimation(.easeInOut(duration: 1).delay(8).repeatForever()) {
                model.rotate(type: .vane, angle: -10)
            }
        }
        .onDisappear {
            model.stopTimers()
        }
//        .onChange(of: model.vaneRotationAngle, initial: false) { old, new in
//            print("New rotation angle of vane was \(old) -> now it is is \(new)")
//        }
//        .printOutput(clockColor.hex, saying: "Color hex code of the clock is")
    }

    @ViewBuilder private var clock: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(clockColor)
                    .frame(width: 300)

                // Akrep
                hand(geometry)
                    .rotationEffect(Angle(degrees: model.handRotationAngle))

                // Yelkovan
                vane(geometry)
                    .rotationEffect(Angle(degrees: model.vaneRotationAngle))
            }
        }
    }

    // Akrep
    @ViewBuilder private func hand(_ geometry: GeometryProxy) -> some View {
        Path { path in
            path.move(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
            path.addLine(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2 - 100))
        }
        .stroke(Color.red, lineWidth: 4)
    }

    // yelkovan
    @ViewBuilder private func vane(_ geometry: GeometryProxy) -> some View {
        Path { path in
            path.move(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
            path.addLine(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2 - 130))
        }
        .stroke(Color.blue, lineWidth: 2)
    }
}

#Preview {
    AnimatedClockView()
}
