//
//  MSJRecommendTopCell.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJRecommendTopCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let topList = MSJRecommendTopList(frame: CGRect(x:0, y: 0, width: frame.width, height: frame.height))
        topList.isScrollEnabled = false
        contentView.addSubview(topList)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
