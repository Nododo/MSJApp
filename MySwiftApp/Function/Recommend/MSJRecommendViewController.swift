//
//  MSJRecommendViewController.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/14.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

let testIdentifier = "testIdentifier"
let testHeaderIdentifier = "testHeaderIdentifier"
let MSJRecommendFirstSectionCellIdentifier = "MSJRecommendFirstSectionCellIdentifier"
let MSJRecommendCommonHeaderReusableViewIdentifier = "MSJRecommendCommonHeaderReusableViewIdentifier"
let MSJRecommendAdCellIdentifier = "MSJRecommendAdCellIdentifier"
let MSJRecommendSmallCellIdentifier = "MSJRecommendSmallCellIdentifier"
let MSJRecommendBigCellIdentifier = "MSJRecommendBigCellIdentifier"

class MSJRecommendViewController: MSJBaseViewController, CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var mainView: UICollectionView!
    
    var scrollIndicator: UIButton!
    
    override func viewDidLoad() {
        //MARK: self.automaticallyAdjustsScrollViewInsets在storyboard中设置为NO
        super.viewDidLoad()
        mainView.delegate = self
        mainView.dataSource = self
        let layout = CHTCollectionViewWaterfallLayout()
        mainView.collectionViewLayout = layout
        
        mainView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: testIdentifier)
        mainView.register(UINib.init(nibName: "MSJRecommendFirstSectionCell", bundle: nil), forCellWithReuseIdentifier: MSJRecommendFirstSectionCellIdentifier)
        mainView.register(MSJRecommendTopReusableView.self, forSupplementaryViewOfKind: CHTCollectionElementKindSectionHeader, withReuseIdentifier: testHeaderIdentifier)
        mainView.register(UINib.init(nibName: "MSJRecommendCommonHeaderReusableView", bundle: nil), forSupplementaryViewOfKind: CHTCollectionElementKindSectionHeader, withReuseIdentifier: MSJRecommendCommonHeaderReusableViewIdentifier)
        mainView.register(MSJRecommendAdCell.self, forCellWithReuseIdentifier: MSJRecommendAdCellIdentifier)
        mainView.register(UINib.init(nibName: "MSJRecommendSmallCell", bundle: nil), forCellWithReuseIdentifier: MSJRecommendSmallCellIdentifier)
        mainView.register(UINib.init(nibName: "MSJRecommendBigCell", bundle: nil), forCellWithReuseIdentifier: MSJRecommendBigCellIdentifier)
        
        setupIndicator()
        
        loadData()
    }
    
    func loadData() {
        let para = ["source" : "iphone",
                    "format" : "json",
                    "page" : "1",
                    "app_liketime" : "1482393036"
        ]
        MSJNetManager.shareManager.POST(urlString: "http://api.meishi.cc/v5/index5.php", parameters: para, success: { (result) in
            
        }) { (error) in
            
        }
    }
    
    func setupIndicator() {
        scrollIndicator = UIButton()
        self.view.addSubview(scrollIndicator)
        scrollIndicator.addTarget(self, action: #selector(scrollToTop(_:)), for: .touchUpInside)
        scrollIndicator.backgroundColor = UIColor.randomColor()
        scrollIndicator.isHidden = true
        scrollIndicator.layer.cornerRadius = 25
        scrollIndicator.layer.masksToBounds = true
        scrollIndicator.layer.shouldRasterize = true
        scrollIndicator.layer.rasterizationScale = UIScreen.main.scale
        scrollIndicator.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.bottom.equalTo(-74)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView (_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: screenW, height: 200)
        case 1:
            return CGSize(width: screenW, height: 200)
        case 2:
            return CGSize(width: screenW / 2, height: screenW / 2 + 60)
        case 3:
            return CGSize(width: screenW, height: 200)
        case 4:
            return CGSize(width: screenW / 2, height: screenW / 2 + 60)
        default:
            return CGSize(width: 100, height: 100)
        }
        
    }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         heightForHeaderInSection section: NSInteger) -> CGFloat {
        switch section {
        case 0:
            return sntViewH + 40
        case 1:
            return 40
        case 3:
            return 40
        case 4:
            return 40
        default:
            return 0
        }
        
    }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         heightForFooterInSection section: NSInteger) -> CGFloat {
        return 0
    }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         insetForSectionAtIndex section: NSInteger) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat{
        switch section {
        case 3:
            return 5
        default:
            return 0
        }
    }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         columnCountForSection section: NSInteger) -> NSInteger {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 2
        case 3:
            return 1
        case 4:
            return 2
        default:
            return 1
        }
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 4
        case 3:
            return 4
        case 4:
            return 10
        default:
            return 1
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSJRecommendFirstSectionCellIdentifier, for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSJRecommendAdCellIdentifier, for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSJRecommendSmallCellIdentifier, for: indexPath)
            //cell.backgroundColor = UIColor.randomColor()
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSJRecommendBigCellIdentifier, for: indexPath)
            cell.backgroundColor = UIColor.randomColor()
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSJRecommendSmallCellIdentifier, for: indexPath)
            //cell.backgroundColor = UIColor.randomColor()
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: testIdentifier, for: indexPath)
            cell.backgroundColor = UIColor.randomColor()
            return cell
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == CHTCollectionElementKindSectionHeader {
            switch indexPath.section {
            case 0:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: testHeaderIdentifier, for: indexPath);
                header.backgroundColor = UIColor.white
                return header
            case 1:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MSJRecommendCommonHeaderReusableViewIdentifier, for: indexPath);
                return header
            case 3:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MSJRecommendCommonHeaderReusableViewIdentifier, for: indexPath);
                return header
            case 4:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MSJRecommendCommonHeaderReusableViewIdentifier, for: indexPath);
                return header
            default:
                return UICollectionReusableView()
            }
        }
        return UICollectionReusableView()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 50 {
            scrollIndicator.isHidden = false
        } else {
            scrollIndicator.isHidden = true
        }
    }
    
    func scrollToTop(_ btn: UIButton)  {
        mainView.scrollToTop()
    }
}
