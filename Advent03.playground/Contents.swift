//: Playground - noun: a place where people can play

import UIKit

/*
 --- Day 3: Spiral Memory ---
 
 You come across an experimental new kind of memory stored on an infinite two-dimensional grid.
 
 Each square on the grid is allocated in a spiral pattern starting at a location marked 1 and then counting up while spiraling outward. For example, the first few squares are allocated like this:
 
 17  16  15  14  13
 18   5   4   3  12
 19   6   1   2  11
 20   7   8   9  10
 21  22  23---> ...
 While this is very space-efficient (no squares are skipped), requested data must be carried back to square 1 (the location of the only access port for this memory system) by programs that can only move up, down, left, or right. They always take the shortest path: the Manhattan Distance between the location of the data and square 1.
 
 For example:
 
 Data from square 1 is carried 0 steps, since it's at the access port.
 Data from square 12 is carried 3 steps, such as: down, left, left.
 Data from square 23 is carried only 2 steps: up twice.
 Data from square 1024 must be carried 31 steps.
 How many steps are required to carry the data from the square identified in your puzzle input all the way to the access port?
 
 Your puzzle input is 277678.
 

 */


let input = 277678

// Define memory object & nodes as a modified linked list.
public class MemoryNode<T> {
    var value: T
    weak var neighbor: MemoryNode?
    
    public init(value:T) {
        self.value = value
    }
}

public class SpiralMemory<T> {
    
    public typealias Node = MemoryNode<T?>
    
    private var _count: Int
    
    private var _capacity: Int
    
    private var center: (Int, Int)
    
    public var capacity: Int {
        return _capacity
    }
    
    public var isEmpty: Bool {
        return _count == 0
    }
    
    public var data: [[Node]]
    
    public init(elements: Int) {
        _count = 0
        let squareSize = Int(Float(elements).squareRoot().rounded(.up))
        self._capacity = squareSize * squareSize
        
        var twoDimArray = [[Node]]()
        for _ in 1...squareSize {
            var row = [Node]()
            for _ in 1...squareSize {
                row.append(Node(value: nil))
            }
            twoDimArray.append(row)
        }
        self.data = twoDimArray
        
        print("Initialized: A \(squareSize) x \(squareSize) array was created.")
        
        let center: Int
        if squareSize % 2 == 0 { center = squareSize / 2 - 1 } else { center = squareSize / 2 }
        
        self.center = (center, center)
        print("Output port located at: \(self.center)")
    }
    
    public func printData() {
        print("Data:")
        for row in self.data {
            print("\t", terminator:"")
            for element in row {
                print(element.value ?? "nil", terminator:"\t")
            }
            print("")
        }
    }
    
    public func accessCell(_ cell:Int) -> T? {
        let spiralSize = Int(Float(cell).squareRoot().rounded(.up))
        let upperBound = spiralSize * spiralSize
        let lowerBound = (spiralSize - 1) * (spiralSize - 1)
        print("Accessing [\(cell)]:\n Spiral size: \(spiralSize)\n Bounds: \(lowerBound) - \(upperBound)")
        return data[0][0].value ?? nil
    }
    
    public func set(cell: Int, to newData: T) {
        data[0][0].value = newData
    }
    
    public func set(x: Int, y: Int, to newData: T) {
//        data[x][y] = newData
    }
    
    public func display(_ x: Int, _ y: Int) -> T? {
        
        if let value = data[x][y].value {
            return value
        } else {
            return nil
        }
    }
    
    public func retrieve(_ cell:Int) -> Int? {
        if cell > self.capacity { return nil }
        return 0
    }

}

let testSpiral = SpiralMemory<String>(elements: 22)
testSpiral.capacity
testSpiral.set(cell: 0, to: "Hello")
testSpiral.printData()
testSpiral.accessCell(22)

// Tests
testSpiral.retrieve(1) == 0
testSpiral.retrieve(12) == 3
testSpiral.retrieve(23) == 2
testSpiral.retrieve(1024) == 31

//let puzzleSpiral = AnotherSpiral<Int>(elements: 277678)
//puzzleSpiral.capacity
