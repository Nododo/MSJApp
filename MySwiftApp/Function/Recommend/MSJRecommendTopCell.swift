//
//  MSJRecommendTopCell.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit
import SnapKit

class MSJRecommendTopCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var topList: MSJRecommendTopList!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        topList = MSJRecommendTopList()
        topList.isScrollEnabled = false
        contentView.addSubview(topList)
        
        titleLabel = UILabel()
        titleLabel.backgroundColor = UIColor.randomColor()
        addSubview(titleLabel)
        
        subTitleLabel = UILabel()
        subTitleLabel.backgroundColor = UIColor.randomColor()
        addSubview(subTitleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topList.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(-topLabelH * 2)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(topList.snp.bottom)
            make.height.equalTo(topLabelH)
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(topLabelH)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
