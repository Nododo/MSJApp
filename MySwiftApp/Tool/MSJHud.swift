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
    
    lazy var msgLabel: UILabel = {
        let msgLabel = UILabel()
        self.addSubview(msgLabel)
        return msgLabel
    }()
    
    static func show(type: HudTpye) -> Void {
        let hud = MSJHud(frame: UIScreen.main.bounds)
        switch type {
        case .gif(let gifName, let penetration):
            hud.gifView.snp.makeConstraints({ (make) in
                make.center.equalToSuperview()
                make.height.equalTo(54)
                make.width.equalTo(54)
            })
            SwifterSwift.keyWindow?.addSubview(hud)
            hud.gifView.animate(withGIFNamed: gifName)
        case .label(let msg, let penetration):
            hud.msgLabel.snp.makeConstraints({ (make) in
                make.center.equalToSuperview()
                make.height.equalTo(54)
                make.width.equalTo(54)
            })
            hud.msgLabel.text = msg
            SwifterSwift.keyWindow?.addSubview(hud)
        }
    }
    
    static func hide() {
        for subView in (SwifterSwift.keyWindow?.subviews)! {
            if subView.isKind(of: MSJHud.self) {
                subView.removeFromSuperview()
            }
        }
    }
}
