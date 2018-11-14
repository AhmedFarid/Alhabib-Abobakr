//
//  BannerData.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit
import SwiftyJSON


class BannerData: NSObject {
    
        var c_img: String
        
        init?(dict: [String: JSON]){
            
            guard let c_img = dict["c_img"]?.string else {return nil}
            
            self.c_img = c_img
        }
}
