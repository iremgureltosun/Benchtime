//
//  UIImage.swift
//  Benchtime
//
//  Created by Tosun, Irem on 1.07.2024.
//

import UIKit

extension UIImage {
    func addWatermark(watermark: String) throws -> UIImage {
        let image = self
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
    
    func applyFilter(filterName: String) throws -> UIImage{
        let image = self
        let context = CIContext()
        guard let ciImage = CIImage(image: image) else { throw ProcessingError.ciImageError }

        guard let filter = CIFilter(name: filterName) else {
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

        return UIImage(cgImage: cgImage)
    }
}
