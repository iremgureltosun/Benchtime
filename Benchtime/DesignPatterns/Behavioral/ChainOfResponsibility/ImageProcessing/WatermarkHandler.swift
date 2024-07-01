//
//  WatermarkHandler.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import UIKit

final class WatermarkHandler: HandlerProtocol {
    typealias ContentType = ImageProcessModel

    var next: AnyHandler<ImageProcessModel>?

    func handle(_ input: inout ImageProcessModel) throws {
        print("Adding watermark to image...")
        let markedImage = try input.image.addWatermark(watermark: "Adesso")
        input.updateImage(image: markedImage)
        print("Added watermark successfully!")
    }
}
