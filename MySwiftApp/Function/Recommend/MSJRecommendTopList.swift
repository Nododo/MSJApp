//
//  MSJRecommendTopList.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJRecommendTopList: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var mySans: [TopSan]? {
        didSet {
            reloadData()
        }
    }
    
    
    let identifier: String = "MSJRecommendTopListCellIdentifier"
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return (mySans?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MSJRecommendTopListCell
        cell.textIsLeft = (indexPath.section % 2 == 0)
        cell.san = mySans?[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (sntViewH - topLabelH * 3 / 2 - 10) / 3//10 is the padding
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        separatorInset = UIEdgeInsetsMake(0, 0, 5, 0)
        delegate = self
        dataSource = self
        register(UINib.init(nibName: "MSJRecommendTopListCell", bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
