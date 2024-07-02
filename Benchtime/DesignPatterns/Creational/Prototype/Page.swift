//
//  Page.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import Foundation

final class Book {
    let authorName: String
    let subject: String
    let price: Double
    
    init(authorName: String, subject: String, price: Double) {
        self.authorName = authorName
        self.subject = subject
        self.price = price
    }
}

final class Page: NSCopying {
    let title: String
    let content: String
    let book: Book

    init(title: String, content: String, book: Book) {
        self.title = title
        self.content = content
        self.book = book
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Page(title: title, content: content, book: self.book)
    }
}
