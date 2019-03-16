import Foundation

extension RandomAccessCollection where Element: Comparable {
    func binarySearch(element: Element, inRange range: Range<Index>? = nil) -> Index? {
        
        let range = range ?? startIndex ..< endIndex
        guard range.lowerBound < range.upperBound else { return nil }

        let size = distance(from: range.lowerBound, to: range.upperBound)
        let midpoint = index(range.lowerBound, offsetBy: size/2)
        
        if self[midpoint] == element {
            return midpoint
        } else if self[midpoint] > element {
            return binarySearch(element: element, inRange: range.lowerBound..<midpoint)
        } else {
            return binarySearch(element: element, inRange: index(after: midpoint)..<range.upperBound)
        }
    }
}

let array = [1,2,3,4,5,6]
array.binarySearch(element: 6)
