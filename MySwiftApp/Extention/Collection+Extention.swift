//
//  Collection+Extention.swift
//  MySwiftApp
//
//  Created by coohua on 17/1/3.
//  Copyright © 2017年 Nododo. All rights reserved.
//

import Foundation
public extension Array {
    func items(fromInex: Int, toIndex: Int) -> [Element]? {
        if fromInex < self.count && toIndex < self.count {
            var array = [Element]()
            for i in fromInex...toIndex {
                array .append(self[i])
            }
            return array
        }
        return nil
    }
}
