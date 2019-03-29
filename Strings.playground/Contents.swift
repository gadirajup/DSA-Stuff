import UIKit

var str = ["an.gelsky@gmail.com", "hel.l+ugly@yahoo.com"]

func edit(_ strs: [String]) -> String {
    
    var resultStrings = [String]()
    
    for str in strs {
        if let rawName = str.split(separator: "@").first {
            let name = rawName.replacingOccurrences(of: ".", with: "")
            let startIndex = name.index(name.startIndex, offsetBy: 0)
            let endIndex = name.index(name.lastIndex(of: "+") ?? name.endIndex, offsetBy: 0)
            
            resultStrings.append( String(name[startIndex..<endIndex]) )
        }
    }
    return resultStrings.joined(separator: "-")
}

edit(str)

let new = str.reversed()

var string = "501234567"

var index = string.index(string.startIndex, offsetBy: string.count/2)

string.remove(at: index)
string.dropLast()
string.description

string
index = string.index(after: string.startIndex)
string[index...]

string.sorted()
string

string.sorted { (c, c2) -> Bool in
    c2 < c
}

string.max()

var newStr = string.filter({$0 < "5"})
newStr

let str9 = string.map { (c) -> Int in
    Int(String(c))!
}
str9

let str10 = string.filter( { Int.init($0) } )
