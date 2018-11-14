//
//  peorttryDetilasVC.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit
import WebKit

class peorttryDetilasVC: UIViewController  {
    
    

    @IBOutlet weak var webView: WKWebView!
    var singelItems : peotryData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getViedo(vidoCode: singelItems?.c_link ?? "")
    }
    
    
    func getViedo(vidoCode: String){
        let url = URL(string: vidoCode)
        webView.load(URLRequest(url: url!))
    }
}
