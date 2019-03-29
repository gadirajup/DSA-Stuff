import Foundation


class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}


let a = Node(20)
let b = Node(25)
let c = Node(9)
let d = Node(12)
let e = Node(14)
let f = Node(11)
let g = Node(5)

a.left = c
a.right = b

c.left = g
c.right = d

d.left = f
d.right = e


func findLargestSmallerKey(rootNode: Node, num: Int) -> Int {
    
    var current: Node? = rootNode
    var result = -1
    
    while let node = current {
        if num <= node.value {
            current = node.left
        } else {
            result = node.value
            current = node.right
        }
    }
    return result
}


findLargestSmallerKey(rootNode: a, num: 6)
