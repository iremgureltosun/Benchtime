//
//  WatermarkHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import UIKit

final class WatermarkHandler: HandlerProtocol {
    typealias T = UIImage

    func handle(_ input: inout UIImage) throws {
        print("Adding watermark to image...")
        input = try addWatermark(image: input, watermark: "Adesso")
        print("Added watermark successfully!")
    }

    private func addWatermark(image: UIImage, watermark: String) throws -> UIImage {
        let textColor = UIColor.red
        let textFont = UIFont.systemFont(ofSize: 60)

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)

        // Ensure image is drawn correctly in the context
        image.draw(in: CGRect(origin: .zero, size: image.size))

        // Set text attributes
        let textFontAttributes: [NSAttributedString.Key: Any] = [
            .font: textFont,
            .foregroundColor: textColor,
        ]

        // Calculate the size of the watermark text
        let textSize = watermark.size(withAttributes: textFontAttributes)

        // Position the watermark at the bottom right corner with a margin
        let rect = CGRect(
            x: image.size.width - textSize.width - 20,
            y: image.size.height - textSize.height - 20,
            width: textSize.width,
            height: textSize.height
        )

        // Draw the watermark text
        watermark.draw(in: rect, withAttributes: textFontAttributes)

        // Retrieve the new image
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            throw ProcessingError.watermarkError
        }

        UIGraphicsEndImageContext()
        return newImage
    }
}
