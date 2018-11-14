//
//  BookViewVC.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit
import WebKit

class BookViewVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getViedo(vidoCode: "http://alhabib-abobakr.com/uploads/Books/\(url)")
    }
    
    func getViedo(vidoCode: String){
        let url = URL(string: vidoCode)
        webView.load(URLRequest(url: url!))
    }
}
