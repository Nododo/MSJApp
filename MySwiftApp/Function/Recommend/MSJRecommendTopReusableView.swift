//
//  MSJRecommendTopReusableView.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJRecommendTopReusableView: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource {
    var collectionView: UICollectionView!
    var pageControl: UIPageControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let topLayout = MSJRecommendTopReusableLayout()
        collectionView = UICollectionView(frame:CGRect.zero, collectionViewLayout: topLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(MSJRecommendTopCell.self, forCellWithReuseIdentifier: "MSJRecommendTopCell")
        addSubview(collectionView);
        
        pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.numberOfPages = 5
        addSubview(pageControl);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MSJRecommendTopCell", for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(-30)
        }
        
        pageControl.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(collectionView.snp.bottom)
            make.bottom.equalTo(0)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       let currentIndex = Int(collectionView.contentOffset.x / collectionView.frame.width)
        pageControl.currentPage = currentIndex
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
    }
}
