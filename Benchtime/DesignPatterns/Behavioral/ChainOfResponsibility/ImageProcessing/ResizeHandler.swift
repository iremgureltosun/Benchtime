//
//  ResizeHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import UIKit

final class ResizeHandler: HandlerProtocol {
    
    typealias ContentType = ImageProcessModel
    
    var next: AnyHandler<ImageProcessModel>?

    func handle(_ input: inout ImageProcessModel) throws {
        print("Resizing image...")
        let resizedImage = try input.image.resized(to: input.sizes)
        input.updateImage(image: resizedImage)
        print("Image resized successfully")
        try next?.handle(&input)
    }
}

extension UIImage {
    func resized(to size: CGSize) throws -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }

        draw(in: CGRect(origin: .zero, size: size))
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            throw ProcessingError.resizeError
        }
        return image
    }
}
