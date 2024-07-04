//
//  Chart.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import Foundation

/// Benefits of Using the Bridge Pattern
/// Separation of Concerns: You can change the way charts are rendered without changing the chart's data structure or vice versa.
/// Scalability: Adding new chart types or rendering methods requires minimal changes to the existing codebase.
/// Flexibility: You can mix and match different chart types and rendering engines easily.

protocol Chart {
    var renderer: ChartRenderer { get set }
    func draw()
}

/// This example demonstrates how the Bridge pattern can be useful in a Swift and SwiftUI context by allowing flexible and scalable chart rendering options.
protocol ChartRenderer {
    func renderBarChart(data: [Double])
    func renderLineChart(data: [Double])
    func renderPieChart(data: [Double])
}
