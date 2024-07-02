import UIKit

// Prototype patten

let book = Book(authorName: "Irem Tosun", subject: "iOS", price: 400)
let page = Page(title: "page 1", content: "contents", book: book)

let anotherPage = page.copy() as? Page


//Factory pattern
let account1 = PersonalAccountFactory().create()
let result1 = account1.registerAccount()

let account2 = BusinessAccountFactory().create()
let result2 = account2.registerAccount()

let account3 = InvestmentAccountFactory().create()
let result3 = account3.registerAccount()
