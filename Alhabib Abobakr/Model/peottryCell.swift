//
//  peottryCell.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit

class peottryCell: NSObject {
    
    @IBOutlet weak var Image: UIImageView!
    
    func configuerCell(prodect: peotryData) {
    
        Image.image = UIImage(named: "placeholder")
        let s = ("http://alhabib-abobakr.com/uploads/\(prodect.c_img)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        Image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            Image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
