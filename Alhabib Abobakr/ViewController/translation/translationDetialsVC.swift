//
//  translationDetialsVC.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit

class translationDetialsVC: UIViewController {

    
    var singelItems : translationData?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titles: UILabel!
    @IBOutlet weak var des: UITextView!
    //@IBOutlet weak var date: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = singelItems?.title
        des.text = singelItems?.descriptions
        //date.text = singelItems?.c_date
        name.text = (" كتب بواسطه: \(singelItems?.c_name ?? "")")
        titles.text = singelItems?.title
        
        image.image = UIImage(named: "placeholder")
        let s = ("http://alhabib-abobakr.com/uploads/\(singelItems?.c_img ?? "")")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
    }
    
}
