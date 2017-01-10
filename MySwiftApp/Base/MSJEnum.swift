//
//  MSJEnum.swift
//  MySwiftApp
//
//  Created by coohua on 17/1/5.
//  Copyright © 2017年 Nododo. All rights reserved.
//

import Foundation


public enum MealType: Int {
    case breakfast = 0
    case lunch
    case afternoonTea
    case dinner
    case snack
    
    /// 获取现在的钟点  根据钟点获取目前恰当的餐类  根据rawValue 让顶部菜单滑到相应位置
    
    static func configNowMeal() -> MealType {
        let nowDate = Date()
        let nowHour = nowDate.hour
        switch nowHour {
        case 5,6,7,8,9,10:
            return .breakfast
        case 11,12,13:
            return .lunch
        case 14,15,16,17:
            return .afternoonTea
        case 18,19,20:
            return .dinner
        default:
            return .snack
        }
    }
}


public enum HudTpye {
    case gif(gifName: String, penetration: Bool)
    case label(msg: String, penetration: Bool)
}
