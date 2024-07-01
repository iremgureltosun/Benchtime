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
        let filteredImage = try input.image.applyFilter(filterName: input.filterName)
        input.updateImage(image: filteredImage)
        print("Filter applied successfully.")
        try next?.handle(&input)
    }
}
