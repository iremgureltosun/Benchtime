//
//  BarChart.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import Foundation

struct BarChart: Chart {
    var renderer: ChartRenderer
    var data: [Double]
    
    func draw() {
        renderer.renderBarChart(data: data)
    }
}
