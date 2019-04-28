//
//  ArrayExtention.swift
//  DeOfHet
//
//  Created by Prajakta Kulkarni on 23/04/2019.
//  Copyright © 2019 Prajakta Kulkarni. All rights reserved.
//

import Foundation

extension Array {
    /// Returns an array containing this sequence shuffled
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }
    /// Shuffles this sequence in place
    @discardableResult
    mutating func shuffle() -> Array {
        let count = self.count
        indices.lazy.dropLast().forEach {
            swapAt($0, Int(arc4random_uniform(UInt32(count - $0))) + $0)
        }
        return self
    }
    var chooseOne: Element { return self[Int(arc4random_uniform(UInt32(count)))] }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}

extension NSMutableArray{
    var chooseOne:Element{return self[Int(arc4random_uniform(UInt32(count)))]}
    func getElements(_ n: Int) -> NSMutableArray{
        let indexes = NSMutableArray()
        let returnArray = NSMutableArray()
        for _ in 0..<n {
            indexes.add(Int(arc4random_uniform(UInt32(count))))
        }
        for i in 0..<indexes.count {
            returnArray.add(self[i])
        }
        return returnArray
    }
}
