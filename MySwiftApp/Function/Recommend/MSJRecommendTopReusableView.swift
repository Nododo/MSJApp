//
//  MSJRecommendTopReusableView.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJRecommendTopReusableView: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let topLayout = MSJRecommendTopReusableLayout()
        let collectionView = UICollectionView(frame: CGRect(x:0, y:0, width: frame.width, height: frame.height - topPageControlH), collectionViewLayout: topLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(MSJRecommendTopCell.self, forCellWithReuseIdentifier: "MSJRecommendTopCell")
        self.addSubview(collectionView);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MSJRecommendTopCell", for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
