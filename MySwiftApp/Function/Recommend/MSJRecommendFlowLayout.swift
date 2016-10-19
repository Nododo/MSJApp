//
//  MSJRecommendFlowLayout.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

@objc public protocol MSJRecommendFlowLayoutDelegate: UICollectionViewDelegate {
    func collectionView (collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    @objc optional func collectionView (collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                                        heightForHeaderInSection section: NSInteger) -> CGFloat
    
    @objc optional func collectionView (collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                                        heightForFooterInSection section: NSInteger) -> CGFloat
    
    @objc optional func collectionView (collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                                        insetForSectionAtIndex section: NSInteger) -> UIEdgeInsets
    
    @objc optional func collectionView (collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                                        minimumInteritemSpacingForSectionAtIndex section: NSInteger) -> CGFloat
    
    @objc optional func collectionView (collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                                        columnCountForSection section: NSInteger) -> NSInteger
}

public enum MSJRecommendFlowLayoutItemRenderDirection: NSInteger {
    case MSJRecommendFlowLayoutItemRenderDirectionShortestFirst
    case MSJRecommendFlowLayoutItemRenderDirectionLeftToRight
    case MSJRecommendFlowLayoutItemRenderDirectionRightToLeft
}

public let MSJRecommendCollectionElementKindSectionHeader = "MSJRecommendCollectionElementKindSectionHeader"
public let MSJRecommendCollectionElementKindSectionFooter = "MSJRecommendCollectionElementKindSectionFooter"

class MSJRecommendFlowLayout: UICollectionViewLayout {
    public var columnCount: NSInteger {
        didSet{
            invalidateLayout()
        }
    }
    
    public var minimumColumnSpacing : CGFloat{
        didSet{
            invalidateLayout()
        }}
    
    public var minimumInteritemSpacing : CGFloat{
        didSet{
            invalidateLayout()
        }}
    
    public var headerHeight : CGFloat{
        didSet{
            invalidateLayout()
        }}
    
    public var footerHeight : CGFloat{
        didSet{
            invalidateLayout()
        }}
    
    public var sectionInset : UIEdgeInsets{
        didSet{
            invalidateLayout()
        }}
    
    
    public var itemRenderDirection : MSJRecommendFlowLayoutItemRenderDirection{
        didSet{
            invalidateLayout()
        }}
    
    //MARK:需要学习protocol
    public weak var delegate: MSJRecommendFlowLayoutDelegate? {
        get {
            return self.collectionView!.delegate as? MSJRecommendFlowLayoutDelegate
        }
    }
    
    private var columnHeights : NSMutableArray
    private var sectionItemAttributes : NSMutableArray
    private var allItemAttributes : NSMutableArray
    private var headersAttributes : NSMutableDictionary
    private var footersAttributes : NSMutableDictionary
    private  var unionRects : NSMutableArray
    private let unionSize = 20
    
    override public init(){
        self.headerHeight = 0.0
        self.footerHeight = 0.0
        self.columnCount = 2
        self.minimumInteritemSpacing = 10
        self.minimumColumnSpacing = 10
        self.sectionInset = UIEdgeInsets.zero
        self.itemRenderDirection =
            MSJRecommendFlowLayoutItemRenderDirection.MSJRecommendFlowLayoutItemRenderDirectionShortestFirst
        
        headersAttributes = NSMutableDictionary()
        footersAttributes = NSMutableDictionary()
        unionRects = NSMutableArray()
        columnHeights = NSMutableArray()
        allItemAttributes = NSMutableArray()
        sectionItemAttributes = NSMutableArray()
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.headerHeight = 0.0
        self.footerHeight = 0.0
        self.columnCount = 2
        self.minimumInteritemSpacing = 10
        self.minimumColumnSpacing = 10
        self.sectionInset = UIEdgeInsets.zero
        self.itemRenderDirection =
            MSJRecommendFlowLayoutItemRenderDirection.MSJRecommendFlowLayoutItemRenderDirectionShortestFirst
        
        headersAttributes = NSMutableDictionary()
        footersAttributes = NSMutableDictionary()
        unionRects = NSMutableArray()
        columnHeights = NSMutableArray()
        allItemAttributes = NSMutableArray()
        sectionItemAttributes = NSMutableArray()
        super.init(coder: aDecoder)
    }
    
    

    func columnCountForSection(section: NSInteger) -> NSInteger {
        if let columnCount = self.delegate?.collectionView?(collectionView: self.collectionView!, layout: self, columnCountForSection: section) {
            return columnCount
        } else {
            return self.columnCount
        }
    }
    
    func itemWidthInSectionAtIndex(section: NSInteger) -> CGFloat {
        var insets: UIEdgeInsets
        if let sectionInsets = self.delegate?.collectionView?(collectionView: self.collectionView!, layout: self, insetForSectionAtIndex: section) {
            insets = sectionInsets
        } else {
            insets = self.sectionInset
        }
        let width: CGFloat = self.collectionView!.bounds.width - insets.left - insets.right
        let columnCount = self.columnCountForSection(section: section)
        let spaceColumnCount: CGFloat = CGFloat(columnCount - 1);
        return floor(width - (spaceColumnCount * self.minimumColumnSpacing) / CGFloat(columnCount) )
    }
    
    override public func prepare() {
        super.prepare()
        
        let numberOfSections = self.collectionView!.numberOfSections
        if numberOfSections == 0 {
            return
        }
        
        self.headersAttributes.removeAllObjects()
        self.footersAttributes.removeAllObjects()
        self.unionRects.removeAllObjects()
        self.columnHeights.removeAllObjects()
        self.allItemAttributes.removeAllObjects()
        self.sectionItemAttributes.removeAllObjects()
        
        for section in 0 ..< numberOfSections {
            let columnCount = self.columnCountForSection(section: section)
            let sectionColumnHeights = NSMutableArray(capacity: columnCount)
            for idx in 0 ..< columnCount {
                sectionColumnHeights.add(idx)
            }
            self.columnHeights.add(sectionColumnHeights)
        }
        
        var top: CGFloat = 0.0
        var attributes = UICollectionViewLayoutAttributes()
        
        for section in 0 ..< numberOfSections {
            /*
             * 1.获取section相关数值 (minimumInteritemSpacing, sectionInset)
             */
            
            var minimumInteritemSpacing: CGFloat
            if let miniumSpaceing = self.delegate?.collectionView?(collectionView: self.collectionView!, layout: self, minimumInteritemSpacingForSectionAtIndex: section) {
                minimumInteritemSpacing = miniumSpaceing
            } else {
                minimumInteritemSpacing = self.minimumColumnSpacing
            }
            
            var sectionInsets:  UIEdgeInsets
            if let insets = self.delegate?.collectionView?(collectionView: self.collectionView!, layout: self, insetForSectionAtIndex: section){
                sectionInsets = insets
            }else{
                sectionInsets = self.sectionInset
            }
            
            let width = self.collectionView!.bounds.size.width - sectionInsets.left - sectionInsets.right
            let columnCount = self.columnCountForSection(section: section)
            let spaceColumCount = CGFloat(columnCount-1)
            let itemWidth = floor((width - (spaceColumCount * self.minimumColumnSpacing)) / CGFloat(columnCount))
            
            /*
             * 2. Section header
             */
            var heightHeader : CGFloat
            if let height = self.delegate?.collectionView?(collectionView: self.collectionView!, layout: self, heightForHeaderInSection: section){
                heightHeader = height
            }else{
                heightHeader = self.headerHeight
            }
            
            if heightHeader > 0 {
                attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: MSJRecommendCollectionElementKindSectionHeader, with: IndexPath(item: 0, section: section))
                self.headersAttributes.setObject(attributes, forKey: section as NSCopying)
                self.allItemAttributes.add(attributes)
                
                top = attributes.frame.maxY
            }
            top += sectionInsets.top
            for idx in 0 ..< columnCount {
                if let sectionColumnHeights = self.columnHeights[section] as? NSMutableArray {
                    sectionColumnHeights[idx]=top
                }
            }
            
            /*
             * 3. Section items
             */
            let itemCount = self.collectionView!.numberOfItems(inSection:section)
            let itemAttributes = NSMutableArray(capacity: itemCount)
            
            // Item will be put into shortest column.
            for idx in 0 ..< itemCount {
                let indexPath = IndexPath(item: idx, section: section)
                
                let columnIndex = self.nextColumnIndexForItem(item: idx, section: section)
                let xOffset = sectionInsets.left + (itemWidth + self.minimumColumnSpacing) * CGFloat(columnIndex)
                let yOffset = ((self.columnHeights[section] as AnyObject).object(at: columnIndex) as AnyObject).doubleValue
                let itemSize = self.delegate?.collectionView(collectionView: self.collectionView!, layout: self, sizeForItemAtIndexPath: NSIndexPath(item: idx, section: section))
                var itemHeight: CGFloat = 0.0
                if itemSize!.height > 0 && itemSize!.width > 0 {
                    itemHeight = floor(itemSize!.height * itemWidth / itemSize!.width)
                }

                attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = CGRect(x:xOffset, y:CGFloat(yOffset!), width:itemWidth, height:itemHeight)
                itemAttributes.add(attributes)
                self.allItemAttributes.add(attributes)
                
                if let sectionColumnHeights = self.columnHeights[section] as? NSMutableArray {
                    sectionColumnHeights[columnIndex] = attributes.frame.maxY + minimumInteritemSpacing
                }
            }
            self.sectionItemAttributes.add(itemAttributes)

        }
    }
    
    /**
     *  Find the shortest column.
     *
     *  @return index for the shortest column
     */
    func shortestColumnIndexInSection (section: NSInteger) -> NSInteger {
        var index = 0
        var shorestHeight = MAXFLOAT
        
        self.columnHeights[section].enumerateObjectsUsingBlock({(object : AnyObject!, idx : NSInteger,pointer :UnsafeMutablePointer<ObjCBool>) in
            let height = object.floatValue
            if (height<shorestHeight){
                shorestHeight = height
                index = idx
            }
        })
        return index
    }
    
    /**
     *  Find the index for the next column.
     *
     *  @return index for the next column
     */
    func nextColumnIndexForItem (item : NSInteger, section: NSInteger) -> Int {
        var index = 0
        let columnCount = self.columnCountForSection(section: section)
        switch (self.itemRenderDirection){
        case .MSJRecommendFlowLayoutItemRenderDirectionShortestFirst :
            index = self.shortestColumnIndexInSection(section: section)
        case .MSJRecommendFlowLayoutItemRenderDirectionLeftToRight :
            index = (item%columnCount)
        case .MSJRecommendFlowLayoutItemRenderDirectionRightToLeft:
            index = (columnCount - 1) - (item % columnCount);
        }
        return index
    }
}
