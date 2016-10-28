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

class MSJRecommendViewController: MSJBaseViewController, CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDataSource {

    @IBOutlet weak var mainView: UICollectionView!
    
    override func viewDidLoad() {
        //MARK: self.automaticallyAdjustsScrollViewInsets在storyboard中设置为NO
        super.viewDidLoad()
        mainView.delegate = self;
        mainView.dataSource = self;
        let layout = CHTCollectionViewWaterfallLayout()
        mainView.collectionViewLayout = layout
        
        mainView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: testIdentifier)
        mainView.register(MSJRecommendTopReusableView.self, forSupplementaryViewOfKind: CHTCollectionElementKindSectionHeader, withReuseIdentifier: testHeaderIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView (_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
     func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                          heightForHeaderInSection section: NSInteger) -> CGFloat {
        return sntViewH + 40
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
        return 2
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: testIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == CHTCollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: testHeaderIdentifier, for: indexPath);
            header.backgroundColor = UIColor.white
            return header
        }
        return UICollectionReusableView()
    }
}
