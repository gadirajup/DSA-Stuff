import Foundation


// Knapsack Problem

func knapsack(weights: [Int], values: [Int], capacity: Int, numItems: Int, cache: [[Int]: Int]) -> Int {
    var cache = cache
    
    if let value = cache[[capacity,numItems]] {
        return value
    }
    
    if numItems <= 0 || capacity <= 0  {
        cache[[capacity, numItems]] =  0
        return cache[[capacity, numItems]]!
    } else if weights[numItems-1] > capacity {
        cache[[capacity, numItems]] = knapsack(weights: weights, values: values, capacity: capacity, numItems: numItems-1, cache: cache)
        return cache[[capacity, numItems]]!
    } else {
        cache[[capacity, numItems]] = max( (values[numItems-1] + knapsack(weights: weights, values: values, capacity: capacity - weights[numItems-1], numItems: numItems-1, cache: cache)), knapsack(weights: weights, values: values, capacity: capacity, numItems: numItems-1, cache: cache))
        return cache[[capacity, numItems]]!
    }
}

knapsack(weights: [10,20,30,40,50,60,70,80,90,100], values: [60,100,120,150,180,210,250,300,400,500], capacity: 500, numItems: 10, cache: [[Int]: Int]())


// Coin Change Problem - coins and how many ways to get change

func combos(coins: [Int], change: Int, numCoins: Int, cache: [[Int]:Int]) -> Int {
    var cache = cache
    
    if let value = cache[[change, numCoins]] {
        return value
    }
    
    if numCoins <= 0 || change < 0 {
        cache[[change, numCoins]] = 0
    } else if change == 0 {
        cache[[change, numCoins]] = 1
    } else {
        cache[[change, numCoins]] = combos(coins: coins, change: change - coins[numCoins - 1], numCoins: numCoins, cache: cache) + combos(coins: coins, change: change, numCoins: numCoins - 1, cache: cache)
    }
    
    return cache[[change, numCoins]]!
}

combos(coins: [1,5,10,25], change: 100, numCoins: 4, cache: [[Int]: Int]())


var one = ""
var two = "Another"

one + String(two.removeLast())

one.append(two.removeLast())

one
two.dropLast()
