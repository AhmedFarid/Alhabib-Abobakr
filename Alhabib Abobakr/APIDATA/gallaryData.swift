//
//  gallaryData.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class gallaryData: NSObject {

    var c_id: String
    var c_img: String
    
    init?(dict: [String: JSON]){
        
        guard let c_img = dict["c_img"]?.string, let c_id = dict["c_id"]?.string else {return nil}
        
        self.c_img = c_img
        self.c_id = c_id
    }
}

