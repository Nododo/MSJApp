//
//  MSJRecommendTopReusableLayout.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJRecommendTopReusableLayout: UICollectionViewFlowLayout {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.itemSize = CGSize(width: 10, height: 20);
    }
    //storyboard 中要实现下面方法
    override init() {
        super.init()
        self.itemSize = CGSize(width: 10, height: 20);
    }
}
