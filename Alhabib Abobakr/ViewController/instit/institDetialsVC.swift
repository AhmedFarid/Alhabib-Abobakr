//
//  institDetialsVC.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class institDetialsVC: UIViewController {

   
    var singelItems : institData?
    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var titles: UILabel!
    @IBOutlet weak var des: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = singelItems?.title
        
        titles.text = singelItems?.title
        des.text = singelItems?.descriptions
        
        images.image = UIImage(named: "placeholder")
        let s = ("http://alhabib-abobakr.com/uploads/\(singelItems?.c_img ?? "")")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        images.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            images.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
