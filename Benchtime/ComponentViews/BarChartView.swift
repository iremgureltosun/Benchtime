//
//  BarChartView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import SwiftUI

struct BarChartView: View {
    let data: [Double]

    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(data, id: \.self) { value in
                Rectangle()
                    .fill(Color.blue)
                    .frame(height: CGFloat(value))
            }
        }
        .frame(maxHeight: 200)
        .padding()
    }
}

#Preview {
    BarChartView(data: [50, 100, 150, 200, 250])
}
