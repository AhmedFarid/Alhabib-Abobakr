//
//  translateCell.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit

class translateCell: UICollectionViewCell {
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    //@IBOutlet weak var label3: UILabel!
    
    func configuerCell(prodect: translationData) {
        
        label.text = prodect.title
        label2.text = (" كتب بواسطه: \(prodect.c_name)")
        //label3.text = prodect.c_date
        
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

