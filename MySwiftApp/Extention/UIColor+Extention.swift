//
//  UIColor+Extention.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        let r = CGFloat(arc4random() / UInt32.max)
        let g = CGFloat(arc4random() / UInt32.max)
        let b = CGFloat(arc4random() / UInt32.max)
        return UIColor(red: r, green: g, blue: b, alpha: 1);
    }
}
