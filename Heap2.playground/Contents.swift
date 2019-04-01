import Foundation

class Heap {
    var heap = [Int]()
    
    init(h: [Int]) {
        for num in h {
            self.heap.append(num)
            heapifyUp()
        }
    }
    
    func pop() -> Int{
        heap.swapAt(0, heap.count-1)
        let last = heap.removeLast()
        
        heapifyDown()
        
        return last
    }
    
    func heapifyDown() {
        
        var parent = 0
        
        while true {
            let (leftChild, rightChild) = getChildrenOfIndex(parent)
            var newParent = parent
            var swapAtIndex: Int?
            
            print("Hello 1")
            
            if let left = leftChild, let right = rightChild {
                if heap[left] > heap[parent] && heap[right] > parent {
                    if heap[left] > heap[right] {
                        swapAtIndex = left
                        newParent = left
                    } else {
                        swapAtIndex = right
                        newParent = right
                    }
                }
            }
            
            print("Hello 2")

            
            if let left = leftChild {
                if heap[left] > heap[parent] {
                    swapAtIndex = left
                    newParent = left
                }
            }
            
            if let right = rightChild {
                if heap[right] > heap[parent] {
                    swapAtIndex = right
                    newParent = right
                }
            }
            
            print("Hello 3")

            
            if let swap = swapAtIndex {
                heap.swapAt(parent, swap)
                parent = newParent
            } else {
                break
            }
        }
    }
    
    func heapifyUp() {
        guard heap.count > 1 else {return}
        
        let startIndex = 0
        let endIndex = heap.count - 1
        var parentIndex = endIndex
        var swapAtIndex: Int?

        
        while parentIndex > startIndex {
            //print(parentIndex)
            parentIndex = getParentOfIndex(parentIndex)
            let (leftIndex, rightIndex) = getChildrenOfIndex(parentIndex)


            if let left = leftIndex {
                if heap[left] > heap[parentIndex] {
                    swapAtIndex = left
                }
                
                if let right = rightIndex {
                    if heap[right] > heap[left] {

                        swapAtIndex = right
                    }
                }
            }
            
            if let swap = swapAtIndex {
                heap.swapAt(parentIndex, swap)
            }
        }
    }
    
    func getParentOfIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func getChildrenOfIndex(_ index: Int) -> (Int?, Int?) {
        var left: Int? = index*2 + 1
        var right: Int? = left! + 1
        
        if left! > heap.count-1 {
            left = nil
            right = nil
        }
        
        if right! > heap.count-1 {
            right = nil
        }
        
        return (left, right)
    }
    
    func printHeap() {
        print(heap)
    }
}

let array = [1,4,2,-3,4,7,4,6,9,0,-4]

let heap = Heap(h: array)
heap.pop()
heap.printHeap()
