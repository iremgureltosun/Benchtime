//
//  FilterHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import CoreImage
import UIKit

final class FilterHandler: HandlerProtocol {
    typealias T = UIImage

    var next: WatermarkHandler?

    func handle(_ input: inout UIImage) throws {
        print("Applying filter to image...")
        input = try applyFilter(image: input)
        print("Filter applied successfully.")
        try next?.handle(&input)
    }

    private func applyFilter(image: UIImage) throws -> UIImage {
        let context = CIContext()
        let ciImage = CIImage(image: image)

        guard let filter = CIFilter(name: "CISepiaTone") else { throw ProcessingError.filterNotFound }
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        filter.setValue(0.8, forKey: kCIInputIntensityKey)

        guard let outputImage = filter.outputImage, let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { throw ProcessingError.filterError }

        return UIImage(cgImage: cgImage)
    }
}
