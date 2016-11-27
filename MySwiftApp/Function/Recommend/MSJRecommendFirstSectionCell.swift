//
//  MSJRecommendFirstSectionCell.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/11/21.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJRecommendFirstSectionCell: UICollectionViewCell {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    
    var tapBlock: ((NSInteger) ->())? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        btn1.addTarget(self, action: #selector(tapBtn(btn:)), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(tapBtn(btn:)), for: .touchUpInside)
        btn3.addTarget(self, action: #selector(tapBtn(btn:)), for: .touchUpInside)
        btn4.addTarget(self, action: #selector(tapBtn(btn:)), for: .touchUpInside)
        btn5.addTarget(self, action: #selector(tapBtn(btn:)), for: .touchUpInside)
        btn6.addTarget(self, action: #selector(tapBtn(btn:)), for: .touchUpInside)
    }

    func tapBtn(btn: UIButton) {
        
    }
}
