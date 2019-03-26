import Foundation

// Knapsack Problem

// Maximize Value of Bag with Capacity 16 (weight)
// here are the items:
// 1,4,8,10 - Weight
// 1,2,3,4 - Value


func getMaxValueOfKnapsack(weights: [Int], values: [Int], c: Int) -> Int {
    var max = 0
    max = helper(weights.count, c, weights, values)
    return max
}
var memo = [[Int]]()
func helper(_ n: Int,_ c: Int, _ weights: [Int], _ values: [Int]) -> Int {
 
    print("N: \(n) C: \(c)")
    let n = n-1
    if n < 0 || c <= 0 {
        return 0
    } else if weights[n] > c {
        return helper(n, c, weights, values)
    } else {
        let temp1 = values[n] + helper(n, c - weights[n], weights, values)
        let temp2 = helper(n, c, weights, values)
        return max(temp1, temp2)
    }
}

getMaxValueOfKnapsack(weights: [1,4,8,10], values: [1,2,3,4], c: 16)
