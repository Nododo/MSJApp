//
//  UIView+Extention.swift
//  MySwiftApp
//
//  Created by coohua on 17/1/11.
//  Copyright © 2017年 Nododo. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift

public extension UIWindow {
    func enableRespond(enable: Bool) {
        if let tempWindow = SwifterSwift.keyWindow {
            for subView in tempWindow.subviews {
                subView.isUserInteractionEnabled = enable
            }
        }
    }
}
