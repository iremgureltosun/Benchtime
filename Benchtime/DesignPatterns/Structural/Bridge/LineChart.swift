//
//  LineChart.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import Foundation

struct LineChart: Chart {
    var renderer: ChartRenderer
    var data: [Double]
    
    func draw() {
        renderer.renderLineChart(data: data)
    }
}
