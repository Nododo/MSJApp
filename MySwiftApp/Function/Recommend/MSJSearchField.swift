//
//  MSJSearchField.swift
//  MySwiftApp
//
//  Created by coohua on 16/12/26.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJSearchField: UITextField {
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
     return   CGRect(x: -15, y: 0, width: 37, height: 30)
    }
}
