//
//  MementoDoUndoView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 28.06.2024.
//

import SwiftUI

struct MementoDoUndoView: View {
    @State private var viewModel = MementoDoUndoViewModel()

    @State private var currentPath: Path = Path()

    var body: some View {
        VStack {
            Text("Welcome to drawing board. Feel free to draw what you want.")
            Canvas { context, _ in
                // Draw all paths stored in 'drawings'
                for drawing in viewModel.list {
                    context.stroke(drawing.path, with: .color(drawing.color), lineWidth: drawing.lineWidth)
                }

                // Draw the current path
                context.stroke(currentPath, with: .color(.black), lineWidth: 2)
            }
            .gesture(
                DragGesture(minimumDistance: 0.1)
                    .onChanged { value in
                        let point = value.location
                        currentPath.addLine(to: point)
                    }
                    .onEnded { _ in
                        // Store the completed path in 'drawings'
                        viewModel.newDrawing = Drawing(path: currentPath, color: .black, lineWidth: 2)
                        viewModel.saveMemento()

                        // Reset 'currentPath' for the next drawing
                        currentPath = Path()
                    }
            )

            HStack {
                // Clear button
                Button(action: {
                    viewModel.removeAllMementos()
                }) {
                    Text("Clear")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                // Undo button
                Button(action: {
                    viewModel.undo()
                }) {
                    Text("Undo")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                // Redo button
                Button(action: {
                    viewModel.redo()
                }) {
                    Text("Redo")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationBarTitle("Drawing Board")
    }
}

#Preview {
    MementoDoUndoView()
}
