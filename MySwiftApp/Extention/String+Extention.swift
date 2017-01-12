//
//  String+Extention.swift
//  MySwiftApp
//
//  Created by coohua on 17/1/12.
//  Copyright © 2017年 Nododo. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    func size(for font: UIFont, size: CGSize, breakMode: NSLineBreakMode) -> CGSize {
        let str = NSString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = breakMode
        let attr = [NSParagraphStyleAttributeName: paragraphStyle, NSFontAttributeName: font]
        return str.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attr, context: nil).size
    }
}
