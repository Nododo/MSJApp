//
//  MSJCycleAdView.swift
//  MySwiftApp
//
//  Created by coohua on 16/12/8.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit
import SwiftyTimer

class MSJCycleAdView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var pictures: [String]!
    var pictureNames: [String]?
    
    var pageControl: UIPageControl!
    var nameLabel: UILabel!
    var timer: Timer!
    
    public init(frame: CGRect, pictures: [String]!) {
        self.pictures = pictures
        super.init(frame: frame)
        setupSubviews()
        setupTimer()
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
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        
        pageControl = UIPageControl()
        pageControl.numberOfPages = self.pictures.count
        addSubview(pageControl)
        
        nameLabel = UILabel()
        addSubview(nameLabel)
    }
    
    func setupTimer() {
        timer = Timer.every(0.3, { 
            self.scrollToNext()
        })
    }
    
    func scrollToNext()  {
        //为collectionview 添加extention 或者protocol  scroll to next index
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = Int (scrollView.contentOffset.x / collectionView.bounds.width)
        pageControl.currentPage = currentIndex
    }
}

