import Foundation

class Board {
    typealias Position = (row: Int, col: Int)
    var board: [[Int]]
    var size: Int
    
    init(_ size: Int = 8) {
        self.size = size
        board = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
    }
    
    func updateBoard(atPos pos: Position, withValue value: Int) {
        board[pos.row][pos.col] = value
    }
    
    func getRow(fromPosition pos: Position) -> [Int] {
        return board[pos.row]
    }
    
    func getCol(fromPosition pos: Position) -> [Int] {
        var col = [Int]()
        for row in board {
            col.append(row[pos.col])
        }
        return col
    }
    
    func getUpDiag(fromPosition pos: Position) -> [Int] {
        var currentRow = size-1
        var currentCol = pos.col - (currentRow - pos.row)
        print(currentRow, currentCol)

        
        var diag = [Int]()
        
        while currentRow <  size && currentCol < size {
            diag.append(board[currentCol][currentRow])
            currentRow -= 1
            currentCol += 1
        }
        
        return diag
    }
    
    func getDownDiag(fromPosition pos: Position) -> [Int] {
        var currentRow = 0
        var currentCol = pos.col - (pos.row - currentRow)
        print(currentRow, currentCol)

        var diag = [Int]()
        
        while currentRow < size && currentCol < size {
            diag.append(board[currentRow][currentCol])
            currentRow += 1
            currentCol += 1
        }
        
        return diag
    }
    
    func showBoard() {
        for row in board {
            print(row)
        }
        print("")
    }
}

let board = Board()

func solve(board: Board, queens: Int) -> Board {
    if queens == 0 {
        return board
    } else {
        let row = board.size - queens
        var positions = [(Int, Int)]()
        (0..<board.size).forEach { (num) in
            positions.append((row, num))
        }
        
        print(positions)
    }
    
    return board
}

solve(board: board, queens: 8)


//
//board.showBoard()
//board.updateBoard(atPos: (0,0), withValue: 1)
//board.updateBoard(atPos: (0,7), withValue: 2)
//board.updateBoard(atPos: (7,0), withValue: 3)
//board.updateBoard(atPos: (7,7), withValue: 4)
//board.showBoard()
//board.getRow(fromPosition: (0,0))
//board.getCol(fromPosition: (0,0))
//board.getUpDiag(fromPosition: (5,5))
//board.getDownDiag(fromPosition: (3,4))
