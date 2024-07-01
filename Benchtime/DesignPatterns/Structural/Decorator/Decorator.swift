//
//  ImageDecorator.swift
//  Benchtime
//
//  Created by Tosun, Irem on 1.07.2024.
//

import UIKit

class Decorator<T: Editor>: Editor {
    private var editor: T

      required init(_ editor: T) {
          self.editor = editor
      }

    func apply() throws -> T.ContentType {
          print(editor.description + " applies changes")
          return try editor.apply()
      }

      var description: String {
          return "Decorator"
      }
}


extension ImageProcessModel: Editor {
    typealias ContentType = ImageProcessModel
    
    func apply() -> ImageProcessModel  {
        return self
    }

    var description: String {
        return "ImageProcessModel "
    }
}
