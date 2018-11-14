//
//  API+translation.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_translation: NSObject {
    
    class func banner(urls: String, completion: @escaping (_ error: Error?,_ sparParts: [translationData]?)-> Void) {
        let url = urls
        
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
                var products = [translationData]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = translationData.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
}
