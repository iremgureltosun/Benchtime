import UIKit

var order = OrderModel.init(id: "123", orderDate: Date(), customerName: "irem Tosun", totalPrice: 30000, inventorySuccess: true, paymentSuccess: false, shippingSuccess: false, orderConfirmed: false, customerComments: "")
let shoppingHandler = SetupOrderHandlers.setup()
try shoppingHandler.handle(&order)
