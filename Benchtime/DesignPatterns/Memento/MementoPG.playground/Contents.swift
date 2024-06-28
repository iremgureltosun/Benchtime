import UIKit

// Example usage with a text editor
let textEditor = Originator(initialState: "Initial text")
let textCaretaker = CareTaker<String>()

// Initial write
textEditor.setState("Hello, World!")
textCaretaker.save(textEditor.createMemento())

// Write new text
textEditor.setState("Hello, Swift!")
textCaretaker.save(textEditor.createMemento())

// Write another new text
textEditor.setState("Hello, Generic Memento Pattern!")
textCaretaker.save(textEditor.createMemento())

// Undo
if let memento = textCaretaker.undo() {
    textEditor.restore(from: memento)
}
print(textEditor.state) // Output: Hello, Swift!

// Undo again
if let memento = textCaretaker.undo() {
    textEditor.restore(from: memento)
}
print(textEditor.state) // Output: Hello, World!

// Redo
if let memento = textCaretaker.redo() {
    textEditor.restore(from: memento)
}
print(textEditor.state) // Output: Hello, Swift!

textCaretaker.mementos
