//
//  FilterHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import CoreImage
import UIKit

final class ApplyFilterHandler: HandlerProtocol {
    typealias T = ImageProcessModel

    var next: WatermarkHandler?

    func handle(_ input: inout ImageProcessModel) throws {
        print("Applying filter to image...")
        try applyFilter(model: &input)
        print("Filter applied successfully.")
        try next?.handle(&input)
    }

    private func applyFilter(model: inout ImageProcessModel) throws {
        let context = CIContext()
        guard let ciImage = CIImage(image: model.image) else { throw ProcessingError.ciImageError }

        guard let filter = CIFilter(name: model.filterName) else {
            throw ProcessingError.filterNotFound
        }
        filter.setValue(ciImage, forKey: kCIInputImageKey)

        // Dynamically set the filter's other parameters if they exist
        let attributes = filter.attributes
        for (key, _) in attributes {
            if key != kCIInputImageKey, filter.inputKeys.contains(key) {
                // Example of setting a default value for some common filter parameters
                switch key {
                case kCIInputIntensityKey:
                    filter.setValue(0.5, forKey: key)
                case kCIInputRadiusKey:
                    filter.setValue(10.0, forKey: key)
                case kCIInputScaleKey:
                    filter.setValue(1.0, forKey: key)
                case kCIInputCenterKey:
                    filter.setValue(CIVector(x: ciImage.extent.midX, y: ciImage.extent.midY), forKey: key)
                default:
                    break
                }
            }
        }

        guard let outputImage = filter.outputImage, let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { throw ProcessingError.filterError }

        model.updateImage(image: UIImage(cgImage: cgImage))
    }
}
