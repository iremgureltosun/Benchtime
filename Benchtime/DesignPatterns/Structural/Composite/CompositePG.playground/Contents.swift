import UIKit

let items = [2, 2, 5]
let totalPrice = items.reduce(0) { $0 + $1 }
totalPrice.description
