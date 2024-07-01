//
//  File.swift
//  Benchtime
//
//  Created by Tosun, Irem on 1.07.2024.
//

import SwiftUI
import UIKit

struct DecoratorView: View {
    @State private var isShowingImagePicker: Bool = false
    @State private var markedImage: Image?
    let filterList: [String] = CIFilter.filterNames(inCategory: nil)

    // MARK: These are inputs of the process

    @State private var selectedImage: Image?
    @State var selectedFilterName = "CISepiaTone"
    let sizes: CGSize = CGSize(width: 300, height: 300)

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
                            var model = ImageProcessModel(image: inputImage, filterName: selectedFilterName, sizes: sizes)
                            let resizeEditor = ResizeEditor(model)
                            model = try resizeEditor.apply()

                            let filterEditor = FilterEditor(model)
                            model = try filterEditor.apply()

                            let watermarkEditor = WatermarkEditor(model)
                            model = try watermarkEditor.apply()

                            markedImage = model.image.swiftUIImage()
                            selectedImage = nil
                        } catch {
                            print(error)
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

#Preview {
    DecoratorView()
}
