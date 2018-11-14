//
//  peotryData.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class peotryData: NSObject {

    var c_img: String
    var c_id: String
    var c_link: String
    
    init?(dict: [String: JSON]){
        
        guard let c_img = dict["c_img"]?.string, let c_id = dict["c_id"]?.string, let c_link = dict["c_link"]?.string else {return nil}
        
        self.c_img = c_img
        self.c_id = c_id
        self.c_link = c_link
    }
}
