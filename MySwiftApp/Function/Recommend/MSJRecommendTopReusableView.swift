//
//  MSJRecommendTopReusableView.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJRecommendTopReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let topLayout = MSJRecommendTopReusableLayout()
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: topLayout)
        self.addSubview(collectionView);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
