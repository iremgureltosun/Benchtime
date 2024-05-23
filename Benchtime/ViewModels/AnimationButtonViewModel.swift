//
//  AnimationButtonViewModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 23.05.2024.
//

import Combine
import Foundation
import Observation

@Observable final class AnimationButtonViewModel {
    @ObservationIgnored private var subscriptions: Set<AnyCancellable> = []

    var vaneRotationAngle: CGFloat = 0
    var handRotationAngle: CGFloat = 0

    var vaneTimer = 0
    var handTimer = 0

    func startTimers() {
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .scan(0) { accumulated, _ in accumulated + 1 }
            .assign(to: \.vaneTimer, on: self)
            .store(in: &subscriptions)

        Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .scan(0) { accumulated, _ in accumulated + 1 }
            .assign(to: \.handTimer, on: self)
            .store(in: &subscriptions)
    }

    func stopTimers() {
        subscriptions.removeAll()
    }

    func rotate(type: ClockLines, angle: CGFloat) {
        if type == .vane {
            vaneRotationAngle += angle
        } else {
            handRotationAngle += angle
        }
    }
}

enum ClockLines {
    case vane
    case hand
}
