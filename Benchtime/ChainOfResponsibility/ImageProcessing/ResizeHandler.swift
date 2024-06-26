//
//  ResizeHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import UIKit

final class ResizeHandler: HandlerProtocol {
    typealias T = UIImage

    var next: FilterHandler?

    func handle(_ input: inout UIImage) throws {
        print("Resizing image...")
        input = try input.resized(to: CGSize(width: 300, height: 300))
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
