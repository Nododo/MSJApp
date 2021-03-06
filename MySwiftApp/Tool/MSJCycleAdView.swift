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


enum MSJCycleAdViewAlignment {
    case left
    case center
    case right
}


let MSJCycleAdCellIdentifier = "MSJCycleAdCellIdentifier"

class MSJCycleAdView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var shops: [RecommendShop]? {
        didSet {
            pageControl.numberOfPages = (shops?.count)!
            collectionView.reloadData()
        }
    }
    
    var isInfinite: Bool = false {
        didSet {
            invalidateTimer()
            setupTimer()
        }
    }
    
    var collectionView: UICollectionView!
    
    var pageControl: UIPageControl!
    var nameLabel: UILabel!
    var timer: Timer?
    var clickIndexBlock: ((_ index: Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews(frame: frame)
        setupTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(frame: CGRect) {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = frame.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = frame.size
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(MSJCycleAdCell.self, forCellWithReuseIdentifier: MSJCycleAdCellIdentifier)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        addSubview(collectionView)
        
        pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .blue
        pageControl.currentPageIndicatorTintColor = .red
//        pageControl.numberOfPages = (self.shops?.count)!
        addSubview(pageControl)
        
        nameLabel = UILabel()
        nameLabel.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        nameLabel.textAlignment = .center
        addSubview(nameLabel)
    }
    
    func setupTimer() {
        timer = Timer.new(every: 2, {
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
        
//        nameLabel.snp.makeConstraints { (make) in
//            make.top.left.right.equalToSuperview()
//            make.height.equalTo(30)
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.isInfinite == true {
            return 10000
        }
        return shops!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSJCycleAdCellIdentifier, for: indexPath) as! MSJCycleAdCell
        var currentRow: Int
        if self.isInfinite == true {
            currentRow = indexPath.row % (shops?.count)!
        } else {
            currentRow = indexPath.row
        }

        cell.setImageModel(model: (shops?[currentRow])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.isInfinite == true {
            pageControl.currentPage = indexPath.row % (shops?.count)!
        } else {
            pageControl.currentPage = indexPath.row
        }

    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        invalidateTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        setupTimer()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let newBlock = clickIndexBlock {
            if self.isInfinite == true {
                newBlock(indexPath.row % (shops?.count)!)
            } else {
                newBlock(indexPath.row)
            }
            
        }
    }
    
    //MARK: public methods to change the UI
    public func setNameAlignment(alignment: MSJCycleAdViewAlignment) {
        switch alignment {
        case .center:
            nameLabel.textAlignment = .center;
        case .left:
            nameLabel.textAlignment = .left;
        case .right:
            nameLabel.textAlignment = .right;
        }
    }
    
    //todo 添加pageControl位置枚举    添加点击事件代理
}

class MSJCycleAdCell: UICollectionViewCell {
    var imageView: UIImageView!
    var imageModel: RecommendShop?
    public func setImageModel(model: RecommendShop) {
            imageModel = model
            let url = URL(string: model.photo!)
            imageView.kf.setImage(with: url, placeholder: nil)
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


public extension UICollectionView {
     func scrollToNext() {
        let width = self.bounds.width
        let offsetX = self.contentOffset.x
        let offsetItem = Int(offsetX / width)
        let nextItem = offsetItem + 1
        let items = self.numberOfItems(inSection: 0)
        if nextItem >= items {
            let originIndexPath = IndexPath(item: 0, section: 0)
            self.scrollToItem(at: originIndexPath, at: .right, animated: false)
            return
        }
        let nextIndexPath = IndexPath(item: nextItem, section: 0)
        self.scrollToItem(at: nextIndexPath, at: .right, animated: true)
    }
    
     func scrollToTop() {
        self.setContentOffset(CGPoint.zero, animated: true)
    }
}

//MARK: 设置约束后调 调用下面的方法设置圆角也没用
extension UIView {
    public func msj_setCornerRadius(cornerRadius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}
