import Foundation

class Heap<T: Comparable> {
    var heap = [T]()
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    var count: Int {
        return heap.count
    }
    var peak: T? {
        return heap.first
    }
    
    init(elements: [T]) {
        elements.forEach { (element) in
            self.addElement(element: element)
        }
    }
    
    func addElement(element: T) {
        heap.append(element)
        heapifyUp(fromId: count-1)
    }
    
    @discardableResult
    func removeElement() -> T {
        heap.swapAt(0, count-1)
        let last = heap.removeLast()
        
        heapifyDown(fromId: 0)
        
        return last
    }
    
    func getParentId(fromChildId childIndex: Int) -> Int? {
        return count > 1 ? (childIndex - 1) / 2 : nil
    }
    
    func getChildIds(fromParentId parentId: Int) -> (left: Int, right: Int) {
        let leftChild = 2 * parentId + 1
        let rightChild = 2 * parentId + 2
        
        return (leftChild, rightChild)
    }
    
    func heapifyUp(fromId index: Int) {
        guard let parentId = getParentId(fromChildId: index) else {return}
        let (leftChildId, rightChildId) = getChildIds(fromParentId: parentId)
        var swapIndex: Int?
        
        if leftChildId < count && rightChildId < count && heap[leftChildId] > heap[parentId] && heap[rightChildId] > heap[parentId] {
            if heap[leftChildId] > heap[rightChildId] {
                swapIndex = leftChildId
                heap.swapAt(leftChildId, parentId)
            } else {
                swapIndex = rightChildId
            }
        } else {
            if leftChildId < count && heap[leftChildId] > heap[parentId] {
                swapIndex = leftChildId
            } else if rightChildId < count && heap[rightChildId] > heap[parentId]{
                swapIndex = rightChildId
            }
        }
        
        if let swapIndex = swapIndex {
            heap.swapAt(swapIndex, parentId)
        }
        
        if parentId != 0 {
            heapifyUp(fromId: parentId)
        }
    }
    
    func heapifyDown(fromId index: Int) {
        let parentId = index
        let (leftChildId, rightChildId) = getChildIds(fromParentId: parentId)
        var swapIndex: Int?
        
        if leftChildId < count && rightChildId < count && heap[leftChildId] > heap[parentId] && heap[rightChildId] > heap[parentId] {
            if heap[leftChildId] > heap[rightChildId] {
                swapIndex = leftChildId

            } else {
                swapIndex = rightChildId
            }
        } else {
            if leftChildId < count && heap[leftChildId] > heap[parentId] {
                swapIndex = leftChildId
            } else if rightChildId < count && heap[rightChildId] > heap[parentId]{
                swapIndex = rightChildId
            }
        }
        
        if let swapIndex = swapIndex {
            heap.swapAt(swapIndex, parentId)
            heapifyDown(fromId: swapIndex)
        }
    }
    
    func sort() -> [T] {
        let heapCopy = heap
        var sortedHeap = [T]()
        
        for _ in 0..<heap.count {
            sortedHeap.append(removeElement())
        }
        
        heap = heapCopy
        return sortedHeap
    }
}

extension Array where Element: Comparable {
    func isHeap() -> Bool {
        for i in 0..<count {
            let leftChild = 2*i + 1
            let rightChild = 2*i + 2
            
            guard leftChild < count && self[i] > self[leftChild] else {return false}
            guard rightChild < count && self[i] > self[rightChild] else {return false}
        }
        return true
    }
}

let elements = [8,7,6,5,4]
elements.isHeap()

let heap = Heap(elements: [5, 8, 1, 4, 8, 10])
heap.removeElement()
heap.removeElement()
heap.removeElement()
heap.addElement(element: 9)
heap.peak

var sorted = heap.sort()
sorted.reverse()
