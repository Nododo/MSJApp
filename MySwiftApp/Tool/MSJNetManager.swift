//
//  MSJNetManager.swift
//  MySwiftApp
//
//  Created by coohua on 16/12/21.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit
import Alamofire

class MSJNetManager: NSObject {
    typealias MSJNetSuccess = (_ response: AnyObject) -> ()
    typealias MSJNetError = (_ error: NSError) -> ()
    
    static let shareManager: MSJNetManager = {
        let mgr = MSJNetManager()
        return mgr
    }()
    
    lazy var tasks: [URLSessionTask] = [URLSessionTask]()
    
    func GET(urlString: String, parameters: [String : AnyObject]? = nil, success: MSJNetSuccess, error: MSJNetError) {
    }
}
