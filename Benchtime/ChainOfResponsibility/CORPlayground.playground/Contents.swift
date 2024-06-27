import UIKit


let order = OrderModel(id: "123",)
let shoppingHandler = SetupOrderHandlers.setup()
shoppingHandler.next?.handle(&<#T##OrderModel#>)
