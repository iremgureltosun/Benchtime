import UIKit

var greeting = "Hello, playground"

var fieldValidator = FieldValidator(validator: .iban, "TR33 0006 1005 1978 6457 8413 26")
fieldValidator.value = "0"

let name: String = "irem"
let number = Int(name)
