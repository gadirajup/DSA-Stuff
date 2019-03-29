import Foundation

class TrieNode<T: Hashable> {
    var value: T
    weak var parent: TrieNode<T>?
    var children = [T: TrieNode]()
    var isTerminating: Bool = false
    
    init(_ value: T, _ parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: T) {
        guard children[child] != nil else {return}
        children[child] = TrieNode(child, self)
    }
}

class Trie {
    typealias Node = TrieNode<Character>
    let root: Node
    
    init() {
        root = Node(" ")
    }
    
    func insert(word: String) {
        guard !word.isEmpty else { return }
        
        let characters = Array(word.lowercased())
        var currentIndex = 0
        
        var current = root
    
        while currentIndex < characters.count {
            let character = characters[currentIndex]
            
            if let nextNode = current.children[character] {
                current = nextNode
            } else {
                let nextNode = Node(character, current)
                current.children[character] = nextNode
                current = nextNode
            }
            
            if currentIndex == characters.count - 1 {
                current.isTerminating = true
            }
            currentIndex += 1
        }
    }
    
    func contains(word: String) -> Bool {
        guard !word.isEmpty else { return true }
        
        let characters = Array(word)
        var currentIndex = 0
        
        var current = root
        
        while currentIndex < characters.count {
            let character = characters[currentIndex]
            
            if let next = current.children[character] {
                current = next
                
                if currentIndex == characters.count - 1 && current.isTerminating {
                    return true
                }
                
                currentIndex += 1
            } else {
                return false
            }
        }
        return false
    }
}

let trie = Trie()

trie.insert(word: "cute")
trie.contains(word: "cute") // true
trie.contains(word: "cut") // false
trie.insert(word: "cut")
trie.contains(word: "cut") // true
