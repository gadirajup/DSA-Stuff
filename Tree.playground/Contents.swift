import Foundation

class Node<T> {
    var value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: T) {
        self.value = value
    }
    
    func inorderTraversal(visit: (T) -> (Void)) {
        leftChild?.inorderTraversal(visit: visit)
        visit(value)
        rightChild?.inorderTraversal(visit: visit)
    }
    
    func preorderTraversal(visit: (T) -> (Void)) {
        visit(value)
        leftChild?.preorderTraversal(visit: visit)
        rightChild?.preorderTraversal(visit: visit)
    }
    
    func postorderTraversal(visit: (T) -> (Void)) {
        leftChild?.postorderTraversal(visit: visit)
        rightChild?.postorderTraversal(visit: visit)
        visit(value)
    }
    
    func inorderSerialization(visit: (T?) -> (Void)) {
        if let leftChild = leftChild {
            leftChild.inorderTraversal(visit: visit)
        } else {
            visit(nil)
        }
        
        visit(value)
        
        if let rightChild = rightChild {
            rightChild.inorderTraversal(visit: visit)
        } else {
            visit(nil)
        }
    }
    
    func inorderDeserialization(data: inout [T?]) -> Node? {
        guard let lastItem = data.removeLast() else {
            return nil
        }
        
        let node = Node(value: lastItem)
        node.leftChild = inorderDeserialization(data: &data)
        node.rightChild = inorderDeserialization(data: &data)
        
        return node
    }
}


let one = Node(value: 1)
let two = Node(value: 2)
let three = Node(value: 3)
let four = Node(value: 4)
let five = Node(value: 5)

one.leftChild = two
one.rightChild = three

two.leftChild = four
two.rightChild = five

var array1 = [Int?]()
one.inorderSerialization { (value) -> (Void) in
    array1.append(value)
}
array1

var array1Rev = Array(array1.reversed())

let node = one.inorderDeserialization(data: &array1Rev)



var array2 = [Int]()
one.preorderTraversal { (value) -> (Void) in
    array2.append(value)
}

var array3 = [Int]()
one.postorderTraversal { (value) -> (Void) in
    array3.append(value)
}

array2
array3
