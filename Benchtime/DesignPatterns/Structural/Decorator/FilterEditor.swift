//
//  BaseFilter.swift
//  Benchtime
//
//  Created by Tosun, Irem on 1.07.2024.
//

import UIKit

final class FilterEditor<T: Editor>: Decorator<T> where T.ContentType == ImageProcessModel {
    required init(_ editor: T) {
        super.init(editor)
    }

    override func apply() throws -> ImageProcessModel {
        var model = try super.apply()
        let filteredImage = try model.image.applyFilter(filterName: model.filterName)
        model.updateImage(image: filteredImage)
        return model
    }

    override var description: String {
        return "Filter"
    }
}
