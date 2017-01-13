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

public extension UIView {
    func makeAllSubviewsEnableRespond(enable: Bool) {
        if self.subviews.count == 0 {
            return;
        }
        for subview in self.subviews {
            subview.isUserInteractionEnabled = enable;
            subview.makeAllSubviewsEnableRespond(enable: enable)
        }
    }
}


public extension UIWindow {
    func enableRespond(enable: Bool) {
        SwifterSwift.keyWindow?.makeAllSubviewsEnableRespond(enable: enable)
    }
}
