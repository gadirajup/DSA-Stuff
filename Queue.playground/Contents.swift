import Foundation
import XCTest

protocol Queue {
    associatedtype Element
    
    var isEmpty: Bool {get}
    var peek: Element? {get}
    
    mutating func enqueue(element: Element)
    mutating func dequeue() -> Element?
}

struct QueueArray<T>: Queue {
    
    var array = [T]()
    
    var isEmpty: Bool { return array.isEmpty }
    var peek: T? { return isEmpty ? nil : array.first }
    
    mutating func enqueue(element: T) {
        array.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

class QueueArrayTest: XCTestCase {
    
    var q: QueueArray<Int>!
    
    override func setUp() {
        q = QueueArray(array: [1,2,3,4,5])
    }
    
    func test_isEmpty() {
        XCTAssertFalse(q.isEmpty)
    }
}

QueueArrayTest.defaultTestSuite.run()
