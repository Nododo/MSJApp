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
    
    public func GET(urlString: String, parameters: Parameters?, success: MSJNetSuccess?, error: MSJNetError?) {
        Alamofire.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                if let tempSuccess = success {
                    tempSuccess(value as AnyObject)
                }
            case .failure(let failError):
                if let tempError = error {
                    tempError(failError as NSError)
                }
            }
        }
    }
    
    public func POST(urlString: String, parameters: Parameters?, success: MSJNetSuccess?, error: MSJNetError?) {
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                if let tempSuccess = success {
                    tempSuccess(value as AnyObject)
                }
            case .failure(let failError):
                if let tempError = error {
                    tempError(failError as NSError)
                }
            }
        }
    }
}
