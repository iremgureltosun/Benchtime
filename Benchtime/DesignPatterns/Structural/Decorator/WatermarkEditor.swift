//
//  WatermarkApplier.swift
//  Benchtime
//
//  Created by Tosun, Irem on 1.07.2024.
//

import Foundation

final class WatermarkEditor<T: Editor>: Decorator<T> where T.ContentType == ImageProcessModel {
    required init(_ editor: T) {
        super.init(editor)
    }
    
    override func apply() throws -> ImageProcessModel {
        var model = try super.apply()
        let markedImage = try model.image.addWatermark(watermark: "Adesso")
        model.updateImage(image: markedImage)
        return model
    }
}
