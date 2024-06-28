//
//  ToolTipView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 28.06.2024.
//

import SwiftUI

struct ToolTipModifier: ViewModifier {
    @State private var showToolTip = false
    var tooltip: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .onHover { hovering in
                    #if os(macOS)
                        showToolTip = hovering
                    #endif
                }
                .onLongPressGesture {
                    #if !os(macOS)
                        showToolTip.toggle()
                    #endif
                }

            if showToolTip {
                Text("This is an explanation bubble.")
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    //.offset(y: -70)
                    .transition(.opacity)
                    .zIndex(1)
            }
        }
        .animation(.easeInOut, value: showToolTip)
    }
}

