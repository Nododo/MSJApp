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

let labelFont = UIFont.systemFont(ofSize: 15)

class MSJHud: UIView {
    lazy var gifView: GIFImageView = {
        let gifView = GIFImageView()
        self.addSubview(gifView)
        return gifView
    }()
    
    lazy var msgLabel: UILabel = {
        let msgLabel = UILabel()
        msgLabel.font = labelFont
        msgLabel.textAlignment = .center
        msgLabel.lineBreakMode = .byWordWrapping
        msgLabel.numberOfLines = 0
        msgLabel.backgroundColor = UIColor.randomColor()
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
            UIApplication.shared.keyWindow?.addSubview(hud)
            hud.gifView.animate(withGIFNamed: gifName)
            UIApplication.shared.keyWindow?.enableRespond(enable: penetration)
        case .label(let msg, let penetration):
            var msgHeight = msg.size(for: labelFont, size: CGSize(width: 200, height: Int.max), breakMode: .byWordWrapping).height
            if msgHeight < 40 {
                msgHeight = 40
            }
            
            hud.msgLabel.snp.makeConstraints({ (make) in
                make.center.equalToSuperview()
                make.height.equalTo(msgHeight)
                make.width.equalTo(200)
            })
            hud.msgLabel.text = msg
            
            UIApplication.shared.keyWindow?.addSubview(hud)
            UIApplication.shared.keyWindow?.enableRespond(enable: penetration)
        }
    }
    
    static func hide() {
        for subView in (SwifterSwift.keyWindow?.subviews)! {
            if subView.isKind(of: MSJHud.self) {
                subView.removeFromSuperview()
            }
        }
        UIApplication.shared.keyWindow?.enableRespond(enable: true)
    }
}
