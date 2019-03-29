import Foundation

func longestPalindrome(_ s: String) -> String {
    return palindromeHelper(s, "", [Int: String]())
}

func palindromeHelper(_ p1: String, _ p2: String, _ table: [Int: String]) -> String {
    print(p1, p2)
    
    
    if p1.count < p2.count {
        print("Return Empty")
        return ""
    } else if p1 == p2 {
        print("Return ", p1+p2)
        return p1+p2
    } else {
        var p1 = p1
        let left = palindromeHelper(String(p1.dropLast()), String(p1.last!) + p2, table)
        let right = palindromeHelper(String(p1.dropLast()), p2, table)
        
        if left.count > right.count {
            return left
        } else {
            return right
        }
    }
}

longestPalindrome("babad")
