import Foundation

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    
    guard array.count > 1 else { return array }
    
    let midPoint = array.count/2
    
    let left = mergeSort(Array(array[..<midPoint]))
    let right = mergeSort(Array(array[midPoint...]))
    
    return merge(left, right)
}

private func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    
    var leftIndex = 0
    var rightIndex = 0
    var result = [T]()
    
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            result.append(left[leftIndex])
            leftIndex += 1
        } else if left[leftIndex] > right[rightIndex] {
            result.append(right[rightIndex])
            rightIndex += 1
        } else {
            result.append(left[leftIndex])
            leftIndex += 1
            
            result.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}


let unSorted = [4,5,3,7,1,3,9,2,1,0]

let sorted = mergeSort(unSorted)
