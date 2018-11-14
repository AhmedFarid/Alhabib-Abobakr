//
//  BooksDetialsVC.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit

class BooksDetialsVC: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var des: UITextView!
    
    var singelItems : booksData?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = singelItems?.title
        name.text = singelItems?.title
        des.text = singelItems?.descriptions
        date.text = singelItems?.c_date
        
        
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
    
    @IBAction func button(_ sender: Any) {
        self.performSegue(withIdentifier: "suge", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let MaintanceLocationVC = segue.destination as? BookViewVC else { return }
        MaintanceLocationVC.url = singelItems?.c_book ?? ""
    }
    
}
