//
//  RecommendModel.swift
//  MySwiftApp
//
//  Created by coohua on 16/12/28.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import Foundation
import ObjectMapper

typealias JsonDic = [String : Any]

class TopSan : NSObject, Mappable {
    var clickObj : String?
    var clickTrackingURL : String?
    var clickType : String?
    var clickUrls : [AnyObject]?
    var descr : String?
    var favNum : String?
    var id : String?
    var impUrls : [AnyObject]?
    var isRecipe : String?
    var isTj : String?
    var jump : String?
    var pvTrackingURL : String?
    var sft : String?
    var title : String?
    var titlepic : String?
    var tjImg : String?
    
    required init?(map: Map){
        super.init()
        self.mapping(map: map)
    }
    private override init(){}
    
    func mapping(map: Map) {
        clickObj <- map["click_obj"]
        clickTrackingURL <- map["click_trackingURL"]
        clickType <- map["click_type"]
        clickUrls <- map["click_urls"]
        descr <- map["descr"]
        favNum <- map["fav_num"]
        id <- map["id"]
        impUrls <- map["imp_urls"]
        isRecipe <- map["is_recipe"]
        isTj <- map["is_tj"]
        jump <- map["jump"]
        pvTrackingURL <- map["pv_trackingURL"]
        sft <- map["sft"]
        title <- map["title"]
        titlepic <- map["titlepic"]
        tjImg <- map["tj_img"]
        
    }
}
