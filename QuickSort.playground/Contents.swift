import Foundation


let unsortedArray = [4,2,5,7,1,4,2,7,3]

// QuickSort
// Get a pivot element
// create less equal and more arrays and append them recurseiivley


func quickSort(_ array: [Int]) -> [Int] {
    
    if array.count <= 1 {
        return array
    }
    
    let pivot = array[0]
    
    var less = [Int]()
    var equal = [Int]([pivot])
    var more = [Int]()
    
    for i in 1..<array.count {
        if array[i] < pivot {
            less.append(array[i])
        } else if array[i] > pivot {
            more.append(array[i])
        } else if array[i] == pivot {
            equal.append(array[i])
        }
    }
    
    return quickSort(less) + equal + quickSort(more)
}

func quickSortInPlace(_ array: [Int], _ low: Int, _ high: Int) {
    
    if array.count == 1 {
        return
    }
    
    if low >= high {
        return
    }
    
    
    var array = array
    let pivot = array[high - 1]
    var x = low - 1
    
    print(array, low, high, pivot)

    
    for i in low..<high - 1 {
        if array[i] < pivot {
            x += 1
            (array[i], array[x]) = (array[x], array[i])
        }
    }
    
    (array[high - 1], array[x + 1]) = (array[x + 1], array[high - 1])
    
    quickSortInPlace(array, 0, x)
    quickSortInPlace(array, x + 2, high)
}

quickSortInPlace(unsortedArray, 0, unsortedArray.count)
