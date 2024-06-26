//
//  ImageProcessModel.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import UIKit

struct ImageProcessModel {
    var image: UIImage
    var filterName: String
    var sizes: CGSize
    
    mutating func updateImage(image: UIImage) {
        self.image = image
    }
}
