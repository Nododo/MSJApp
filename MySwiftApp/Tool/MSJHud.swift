//
//  MSJHud.swift
//  MySwiftApp
//
//  Created by coohua on 17/1/6.
//  Copyright © 2017年 Nododo. All rights reserved.
//

import UIKit
import Gifu
import SwifterSwift

class MSJHud: UIView {
    lazy var gifView: GIFImageView = {
        let gifView = GIFImageView()
        self.addSubview(gifView)
        return gifView
    }()
    
    static func show(type: HudTpye) -> Void {
        switch type {
        case .gif(name: let gifName):
            let hud = MSJHud(frame: UIScreen.main.bounds)
            hud.gifView.snp.makeConstraints({ (make) in
                make.center.equalToSuperview()
                make.height.equalTo(54)
                make.width.equalTo(54)
            })
            SwifterSwift.keyWindow?.addSubview(hud)
            hud.gifView.animate(withGIFNamed: gifName)
        default:
            return
        }
    }
}
