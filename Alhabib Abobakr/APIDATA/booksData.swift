//
//  booksData.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class booksData: NSObject {
    
    var c_img: String
    var c_date: String
    var title: String
    var descriptions: String
    var c_book: String
    
    init?(dict: [String: JSON]){
        
        guard let c_img = dict["c_img"]?.string, let title = dict["title"]?.string, let descriptions = dict["description"]?.string, let c_book = dict["c_book"]?.string, let c_date = dict["c_date"]?.string else {return nil}
        
        self.c_img = c_img
        self.c_date = c_date
        self.title = title
        self.descriptions = descriptions
        self.c_book = c_book
    }
}
