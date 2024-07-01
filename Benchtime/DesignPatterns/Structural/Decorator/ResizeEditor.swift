//
//  Resizer.swift
//  Benchtime
//
//  Created by Tosun, Irem on 1.07.2024.
//

import UIKit

final class ResizeEditor<T: Editor>: Decorator<T> where T.ContentType == ImageProcessModel {
    required init(_ editor: T) {
        super.init(editor)
    }

    override func apply() throws -> ImageProcessModel {
        var model = try super.apply()
        let resizedImage = try model.image.resized(to: model.sizes)
        model.updateImage(image: resizedImage)
        return model
    }

    override var description: String {
        return "Resizer"
    }
}
