import UIKit

let subject = Subject()

let observer1 = ConcreteObserverA()
let observer2 = ConcreteObserverB()

subject.attach(observer1)
subject.attach(observer2)

subject.someBusinessLogic()
subject.someBusinessLogic()
subject.detach(observer2)
subject.someBusinessLogic()
