//
//  MSJCycleAdView.swift
//  MySwiftApp
//
//  Created by coohua on 16/12/8.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit
import SwiftyTimer
import Kingfisher


class MSJCycleAdView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var imageModels: [MSJCycleAdImageModel]!
    
    var pageControl: UIPageControl!
    var nameLabel: UILabel!
    var timer: Timer?
    
    public init(frame: CGRect, imageModels: [MSJCycleAdImageModel]!) {
        self.imageModels = imageModels
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
        pageControl.numberOfPages = self.imageModels.count
        addSubview(pageControl)
        
        nameLabel = UILabel()
        addSubview(nameLabel)
    }
    
    func setupTimer() {
        timer = Timer.new(every: 0.3, { 
            self.scrollToNext()
        })
        timer?.start(runLoop: .current, modes: .commonModes)
    }
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func scrollToNext()  {
        collectionView.scrollToNext()
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
        return self.imageModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = Int (scrollView.contentOffset.x / collectionView.bounds.width)
        pageControl.currentPage = currentIndex
    }
}

class MSJCycleAdCell: UICollectionViewCell {
    var imageView: UIImageView!
    var imageModel: MSJCycleAdImageModel = MSJCycleAdImageModel() {
        didSet(newValue) {
            let url = URL(string: newValue.imageName)
            imageView.kf.setImage(with: url, placeholder: UIImage(named: newValue.placeholder), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView()
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct MSJCycleAdImageModel {
   var imageName: String = ""
   var title: String?
   var placeholder: String = ""
}

extension UICollectionView {
    public func scrollToNext() {
        let width = self.bounds.width
        let offsetX = self.contentOffset.x
        let offsetItem = Int(offsetX / width)
        let nextItem = offsetItem + 1
        let items = self.numberOfItems(inSection: 0)
        if nextItem >= items {
            return
        }
        let nextIndexPath = IndexPath(item: nextItem, section: 0)
        self.scrollToItem(at: nextIndexPath, at: .right, animated: true)
    }
}
