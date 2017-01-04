//
//  Collection+Extention.swift
//  MySwiftApp
//
//  Created by coohua on 17/1/3.
//  Copyright © 2017年 Nododo. All rights reserved.
//

import Foundation
public extension Array {
    func items(from range: ClosedRange<Int>) -> [Element]? {
        guard range.upperBound <= self.count else { return nil }
        var array = [Element]()
        for i in range.lowerBound...range.upperBound {
            array.append(self[i])
        }
        return array
    }
    
    mutating func appendItems(from array: [Element]) -> Void {
        for i in 0..<array.count {
            self.append(array[i])
        }
    }
}
