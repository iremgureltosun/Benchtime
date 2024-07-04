//
//  FahreneitToCelciusAdapter.swift
//  Benchtime
//
//  Created by Tosun, Irem on 3.07.2024.
//

import Foundation

final class FahrenheitToCelsiusAdapter: CelsiusWeatherService {
    private var fahrenheitService: FahrenheitWeatherService
    
    init(fahrenheitService: FahrenheitWeatherService) {
        self.fahrenheitService = fahrenheitService
    }
    
    var temperatureInCelsius: Double {
        let fahrenheit = fahrenheitService.getTemperatureInFahrenheit()
        return (fahrenheit - 32) * 5 / 9
    }
}
