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
    
    var firstCellModel: FirstCellModel? {
        didSet {
            let url1 = URL(string: (firstCellModel?.fenleis[0].image)!)
            btn1.kf.setImage(with: url1, for: .normal, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            let url2 = URL(string: (firstCellModel?.fenleis[1].image)!)
            btn2.kf.setImage(with: url2, for: .normal, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            let url3 = URL(string: (firstCellModel?.fenleis[2].image)!)
            btn3.kf.setImage(with: url3, for: .normal, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            let url4 = URL(string: (firstCellModel?.fenleis[3].image)!)
            btn4.kf.setImage(with: url4, for: .normal, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            
            let url5 = URL(string: (firstCellModel?.fenleiFuncs[0].image)!)
            btn5.kf.setImage(with: url5, for: .normal, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            let url6 = URL(string: (firstCellModel?.fenleiFuncs[1].image)!)
            btn6.kf.setImage(with: url6, for: .normal, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
        }
        
    }
    
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
