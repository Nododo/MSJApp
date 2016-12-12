//
//  MSJCycleAdView.swift
//  MySwiftApp
//
//  Created by coohua on 16/12/8.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJCycleAdView: UIView {
    
    var collectionView: UICollectionView!
    var pageControl: UIPageControl!
    var pictures: [String]!
    
    public init(frame: CGRect, pictures: [String]!) {
        self.pictures = pictures
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        addSubview(collectionView)
        
        pageControl = UIPageControl()
        pageControl.numberOfPages = self.pictures.count
        addSubview(pageControl)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

