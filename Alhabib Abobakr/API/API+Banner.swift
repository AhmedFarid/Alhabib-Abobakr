//
//  API+Banner.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/13/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Banner: NSObject {
    
    class func banner(completion: @escaping (_ error: Error?,_ sparParts: [BannerData]?)-> Void) {
        let url = "http://alhabib-abobakr.com/api_elshekh/MainApp/api_token=222&lang=en&section=slider"
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [BannerData]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = BannerData.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }

}
