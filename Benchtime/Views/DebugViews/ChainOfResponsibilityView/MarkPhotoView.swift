//
//  MarkPhotoView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import SwiftUI
import UIKit

struct MarkPhotoView: View {
    @State private var selectedImage: Image?
    @State private var isShowingImagePicker: Bool = false
    @State private var markedImage: Image?

    var body: some View {
        VStack {
            Button("Select Image") {
                isShowingImagePicker = true
            }

            if let image = selectedImage {
                image
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFit()

                Button("Start Processing the Image") {
                    let resizeHandler = ImageProcessingSetup.setup()
                    if var input = image.getUIImage() {
                        do {
                            try resizeHandler.handle(&input)
                            markedImage = input.swiftUIImage()
                            selectedImage = nil
                        } catch {
                            print("Error: \(error.localizedDescription)")
                        }
                    }
                }
            }

            if let markedImage = markedImage {
                markedImage
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFit()
            }
        }
        .fullScreenCover(isPresented: $isShowingImagePicker, onDismiss: {}, content: {
            ImagePicker(selectedImage: self.$selectedImage, isShowingImagePicker: self.$isShowingImagePicker)
        })
    }
}

extension UIImage {
    func swiftUIImage() -> Image {
        return Image(uiImage: self)
    }
}

extension Image {
    @MainActor
    func getUIImage() -> UIImage? {
        let image = resizable()
            .scaledToFill()
            .clipped()
        return ImageRenderer(content: image).uiImage
    }
}

#Preview {
    MarkPhotoView()
}
