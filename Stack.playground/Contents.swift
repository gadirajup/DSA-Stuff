import Foundation
import XCTest

struct Stack<Element: Equatable>: Equatable, CustomStringConvertible, ExpressibleByArrayLiteral {
    
    var stack = [Element]()
    
    var isEmpty: Bool {
        return peek() == nil
    }
    
    init(arrayLiteral elements: Element...) {
        stack = elements
    }
    
    func peek() -> Element?{
        return stack.last
    }
    
    mutating func push(element: Element) {
        stack.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return stack.popLast()
    }
    
    var description: String {
        return stack.map({"\($0)"}).joined(separator: " ")
    }
}

func checkBalancedString(string: String) -> Bool {
    var stringStack = Stack<Character>()
    
    for character in string {
        if character == "(" {
            stringStack.push(element: character)
        } else if character == ")" {
            if stringStack.isEmpty {
                return false
            }
            stringStack.pop()
        }
    }
    return stringStack.isEmpty
}


class StackTest: XCTestCase {
    var stack = Stack<Int>()

    override func setUp() {
        
        stack.push(element: 1)
        stack.push(element: 2)
        stack.push(element: 3)
        stack.push(element: 4)
        stack.push(element: 5)
    }
    
    func test_stack() {
        XCTAssertEqual(stack.description, "1 2 3 4 5")
    }
    
    func test_pop() {
        stack.pop()
        XCTAssertEqual(stack.description, "1 2 3 4")
    }
    
    func test_isEmpty() {
        XCTAssertFalse(stack.isEmpty)
    }
    
    func test_Literal() {
        let movieStack: Stack = ["Begins", "Dark Knight", "Rises"]
        XCTAssertEqual(movieStack.description, "Begins Dark Knight Rises")
    }
    
    func test_Balance() {
        XCTAssertTrue(checkBalancedString(string: "(())"))
        XCTAssertTrue(checkBalancedString(string: "(m(e)a)"))
        XCTAssertTrue(checkBalancedString(string: "((()()))"))
    }
}

StackTest.defaultTestSuite.run()
