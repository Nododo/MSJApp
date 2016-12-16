
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let models = [MSJCycleAdImageModel(imageName: "1", title: "1", placeholder: "2"), MSJCycleAdImageModel(imageName: "1", title: "2", placeholder: "2"), MSJCycleAdImageModel(imageName: "1", title: "3", placeholder: "2"), MSJCycleAdImageModel(imageName: "1", title: nil, placeholder: "2")]
        adView = MSJCycleAdView(frame: frame, imageModels:models)
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
