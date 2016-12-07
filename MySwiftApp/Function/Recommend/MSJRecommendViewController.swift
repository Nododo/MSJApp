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

class MSJRecommendViewController: MSJBaseViewController, CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDataSource {

    @IBOutlet weak var mainView: UICollectionView!
    
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView (_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: screenW, height: 200)
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
                          minimumInteritemSpacingForSectionAtIndex section: NSInteger) -> CGFloat {
        return 0
    }
    
     func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                          columnCountForSection section: NSInteger) -> NSInteger {
        switch section {
        case 0:
            return 1
        default:
            return 1
        }
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 1
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSJRecommendFirstSectionCellIdentifier, for: indexPath)
//            cell.backgroundColor = UIColor.randomColor()
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
                header.backgroundColor = UIColor.randomColor()
                return header
            default:
                 return UICollectionReusableView()
            }
        }
        return UICollectionReusableView()
    }
}
