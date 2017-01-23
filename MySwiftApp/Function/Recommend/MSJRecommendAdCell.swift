
//
//  MSJRecommendAdCell.swift
//  MySwiftApp
//
//  Created by coohua on 16/12/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJRecommendAdCell: UICollectionViewCell {
    var adView: MSJCycleAdView!
    var shops: [RecommendShop]? {
        didSet {
            adView.shops = shops
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        adView = MSJCycleAdView(frame: frame)
        adView.isInfinite = true
        adView.clickIndexBlock = {index in
            print(index)
        }
        contentView.addSubview(adView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
