//
//  WatermarkHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import UIKit

final class WatermarkHandler: HandlerProtocol {
    typealias T = ImageProcessModel

    func handle(_ input: inout ImageProcessModel) throws {
        print("Adding watermark to image...")
        let markedImage = try addWatermark(image: input.image, watermark: "Adesso")
        input.updateImage(image: markedImage)
        print("Added watermark successfully!")
    }

    private func addWatermark(image: UIImage, watermark: String) throws -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont.systemFont(ofSize: 60)
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        // Ensure the image is drawn correctly in the context
        image.draw(in: CGRect(origin: .zero, size: image.size))
        
        // Set text attributes
        let textFontAttributes: [NSAttributedString.Key: Any] = [
            .font: textFont,
            .foregroundColor: textColor
        ]
        
        // Calculate the size of the watermark text
        let textSize = watermark.size(withAttributes: textFontAttributes)
        
        // Calculate the position to center the text
        let textRect = CGRect(
            x: (image.size.width - textSize.width) / 2,
            y: (image.size.height - textSize.height) / 2,
            width: textSize.width,
            height: textSize.height
        )
        
        // Calculate the ellipse around the text
        let ellipseRect = textRect.insetBy(dx: -20, dy: -10)
        
        // Draw the ellipse
        let ellipsePath = UIBezierPath(ovalIn: ellipseRect)
        UIColor.white.withAlphaComponent(0.5).setFill()
        ellipsePath.fill()
        
        // Draw the watermark text
        watermark.draw(in: textRect, withAttributes: textFontAttributes)
        
        // Retrieve the new image
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            throw ProcessingError.watermarkError
        }
        
        UIGraphicsEndImageContext()
        return newImage
    }

}
