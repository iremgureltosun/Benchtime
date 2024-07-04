//
//  PieChartView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

import SwiftUI

struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
}

struct PieSliceView: View {
    var pieSliceData: PieSliceData

    var midRadians: Double {
        return Double(pieSliceData.startAngle.radians + pieSliceData.endAngle.radians) / 2.0
    }

    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let height = width
            let center = CGPoint(x: width * 0.5, y: height * 0.5)
            let radius = width * 0.5

            let path = Path { path in
                path.move(to: center)
                path.addArc(center: center, radius: radius, startAngle: pieSliceData.startAngle, endAngle: pieSliceData.endAngle, clockwise: false)
            }

            path.fill(pieSliceData.color)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct PieChartView: View {
    var data: [Double]
    var colors: [Color]

    var slices: [PieSliceData] {
        let sum = data.reduce(0, +)
        var endAngle = Angle(degrees: 0)
        var slices = [PieSliceData]()

        for (index, value) in data.enumerated() {
            let degrees = value * 360 / sum
            let startAngle = endAngle
            endAngle = startAngle + Angle(degrees: degrees)

            slices.append(PieSliceData(startAngle: startAngle, endAngle: endAngle, color: colors[index % colors.count]))
        }

        return slices
    }

    var body: some View {
        ZStack {
            ForEach(0 ..< slices.count, id: \.self) { index in
                PieSliceView(pieSliceData: slices[index])
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        PieChartView(data: [10, 20, 30, 40], colors: [.red, .green, .blue, .orange])
            .frame(width: 300, height: 300)
            .padding()
    }
}

#Preview {
    ContentView()
}
