//
//  MarkPhotoView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import SwiftUI
import UIKit

struct MarkPhotoView: View {
    @State private var isShowingImagePicker: Bool = false
    @State private var markedImage: Image?
    let filterList: [String] = CIFilter.filterNames(inCategory: nil)

    // MARK: These are inputs of the process

    @State private var selectedImage: Image?
    @State var selectedFilterName = "CISepiaTone"
    let sizes: CGSize = CGSize(width: 300, height: 300)
    
    // Defining the handlers for image processing
    let resizeHandler = AnyHandler(ResizeHandler())
    let filterHandler = AnyHandler(ApplyFilterHandler())
    let watermarkHandler = AnyHandler(WatermarkHandler())

    var body: some View {
        VStack {
            CustomButton(buttonTitle: "Select Image", themeStyle: .ocean) {
                isShowingImagePicker = true
                markedImage = nil
            }
            .frame(height: 55)
            .padding()
            
            Spacer()
            
            if let image = selectedImage {
                image
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFit()

                Picker("Filter", selection: $selectedFilterName) {
                    ForEach(filterList, id: \.self) { option in
                        Text(option)
                            .tag(option)
                    }
                }
                .pickerStyle(MenuPickerStyle())

        

                CustomButton(buttonTitle: "Start Processing the Image", themeStyle: .desert) {
                    if let inputImage = image.getUIImage() {
                        do {
                            var modelProcess = ImageProcessModel(image: inputImage, filterName: selectedFilterName, sizes: sizes)
                            resizeHandler.setNext(handler: filterHandler).setNext(handler: watermarkHandler)
                            
                            try resizeHandler.handle(&modelProcess)
                            markedImage = modelProcess.image.swiftUIImage()
                            selectedImage = nil
                        } catch {
                            print("Error: \(error)")
                        }
                    }
                }
                .frame(height: 55)
                .padding()
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
