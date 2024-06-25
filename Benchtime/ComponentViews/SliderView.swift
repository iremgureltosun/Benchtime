//
//  SliderView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 24.06.2024.
//

import SwiftUI

struct SliderView: View {
    @State private var sliderValue: Double = 0.5

    var body: some View {
        VStack {
            Slider(value: $sliderValue, in: 0...1, step: 0.01)
                .padding()
            
            Text("Slider value: \(sliderValue)")
        }
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
