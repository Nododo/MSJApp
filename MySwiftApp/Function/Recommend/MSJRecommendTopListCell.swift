//
//  MSJRecommendTopListCell.swift
//  MySwiftApp
//
//  Created by 杜维欣 on 16/10/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MSJRecommendTopListCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var picView: UIImageView!
    var textIsLeft: Bool! {
        didSet {
            if textIsLeft == true {
                nameLabel.textAlignment = .left
                contentLabel.textAlignment = .left
            } else {
                nameLabel.textAlignment = .right
                contentLabel.textAlignment = .right
            }
        }
    }
    
    var san: TopSan? {
        didSet {
            guard san != nil else { return }
            nameLabel.text = san!.title
            contentLabel.text = san!.descr
            let url = URL(string: (san!.titlepic)!)
            picView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
