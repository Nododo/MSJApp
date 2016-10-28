//
//  MSJRecommendTopReusableLayout.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

public let screenW = UIScreen.main.bounds.width
public let screenH = UIScreen.main.bounds.height
public let navigationBarH: CGFloat = 64
public let tabbarH: CGFloat = 44
public let sntViewH = screenH - navigationBarH - tabbarH
public let topLabelH: CGFloat = 44

class MSJRecommendTopReusableLayout: UICollectionViewFlowLayout {

    //storyboard 中要实现下面方法
    override init() {
        super.init()
        self.scrollDirection = .horizontal
    }
    
    override func prepare() {
        super.prepare()
        self.itemSize = CGSize(width: screenW - 10, height: self.collectionView!.bounds.height)
        self.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
