import UIKit

// Adapter pattern

let service2 = FahrenheitWeatherService()
let fahreneitAdapter = FahrenheitToCelsiusAdapter(fahrenheitService: service2)
let service2InCelcius = fahreneitAdapter.temperatureInCelsius

// Bridge pattern

let barChart = BarChart(renderer: CoreGraphicsRenderer(), data: [10, 20, 30])
barChart.draw() // Output: Rendering Bar Chart with CoreGraphics

let lineChart = LineChart(renderer: MetalRenderer(), data: [5, 15, 25])
lineChart.draw() // Output: Rendering Line Chart with Metal

let pieChart = PieChart(renderer: SwiftUIRenderer(), data: [10, 20, 30])
pieChart.draw() // Output: Rendering Pie Chart with SwiftUI
