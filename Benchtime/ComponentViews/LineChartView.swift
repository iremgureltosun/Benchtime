//
//  LineChartView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

struct LineChartView: View {
    let data: [CGPoint]

    var body: some View {
        Canvas { context, _ in
            let path = Path { path in
                path.move(to: data.first!)
                for point in data.dropFirst() {
                    path.addLine(to: point)
                }
            }
            context.stroke(path, with: .color(.blue), lineWidth: 2)
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

#Preview {
    LineChartView(data: [CGPoint(x: 0, y: 0), CGPoint(x: 50, y: 80), CGPoint(x: 100, y: 120), CGPoint(x: 150, y: 90), CGPoint(x: 200, y: 60), CGPoint(x: 250, y: 150)])
}
