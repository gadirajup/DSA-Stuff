import Foundation

class Node<Element> {
    var value: Element
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Element) {
        self.value = value
    }
}

class Tree<Element> {
    var root: Node<Element>?
    
    init(elements: [Element]) {
        for element in elements {
            addElement(element: element)
        }
    }
    
    func addElement(element: Element) {
        
        let node = Node(value: element)
        
        if root == nil {
            root = node
            return
        }
        
        var treeStack = [Node<Element>]()
        treeStack.append(root!)
        
        while !treeStack.isEmpty {
            let current = treeStack.removeLast()
            
            if current.leftChild == nil {
                current.leftChild = node
                return
            }
            
            if current.rightChild == nil {
                current.rightChild = node
                return
            }
            
            treeStack.insert(current.leftChild!, at: 0)
            treeStack.insert(current.rightChild!, at: 0)
        }
    }
    
    func BFS() {
        var treeStack = [Node<Element>]()
        treeStack.append(root!)
        
        while !treeStack.isEmpty {
            let current = treeStack.removeLast()
            
            print(current.value)
            
            if current.leftChild != nil {
                treeStack.insert(current.leftChild!, at: 0)
            }
            
            if current.rightChild != nil {
                treeStack.insert(current.rightChild!, at: 0)
            }
        }
    }
}

let t = Tree(elements: [1,2,3,4,5,6,7])
t.BFS()
