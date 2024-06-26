//
//  ImageProcessingSetup.swift
//  Benchtime
//
//  Created by Tosun, Irem on 26.06.2024.
//

import Foundation

struct ImageProcessingSetup {
    static func setup() -> ResizeHandler {
        let resizeHandler = ResizeHandler()
        let filterHandler = FilterHandler()
        let watermarkHandler = WatermarkHandler()
        resizeHandler.next = filterHandler
        filterHandler.next = watermarkHandler

        return resizeHandler
    }
}
