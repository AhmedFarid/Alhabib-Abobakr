//
//  institData.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class institData: NSObject {
    
    var c_img: String
    var title: String
    var descriptions: String
    
    init?(dict: [String: JSON]){
        
        guard let c_img = dict["c_img"]?.string, let title = dict["title"]?.string, let descriptions = dict["description"]?.string else {return nil}
        
        self.c_img = c_img
        self.title = title
        self.descriptions = descriptions
    }
}

