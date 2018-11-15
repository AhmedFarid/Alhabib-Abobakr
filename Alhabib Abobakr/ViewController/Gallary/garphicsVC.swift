//
//  garphicsVC.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/15/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit

class garphicsVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    var gallry = [gallaryData]()
    
    
    @IBOutlet weak var gallary: UICollectionView!
    @IBOutlet weak var banner: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gallary.delegate = self
        gallary.dataSource = self
        
        banner.delegate = self
        banner.dataSource = self
        
        handleRefresh()
        
    }
    
    @objc private func handleRefresh() {
        
        API_Gallary.banner(urls: "http://alhabib-abobakr.com/api_elshekh/MainApp/api_token=222&lang=en&section=garphics"){ (error: Error?, gallry: [gallaryData]?) in
            if let gallry = gallry {
                self.gallry = gallry
                print("xxx\(self.gallry)")
                self.gallary.reloadData()
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 0 {
            return 1
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 1
        }else{
            return gallry.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = banner.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }else{
            if let cells = gallary.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? galleryCell {
                let inst = gallry[indexPath.row]
                cells.configuerCell(prodect: inst)
                return cells
            }else{
                return galleryCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
            let screenWidth = UIScreen.main.bounds.width
            var width = screenWidth
            var hight = screenWidth
            
            width = width > 413 ? 413 : width
            hight = hight > 154 ? 164 : hight
            
            return CGSize.init(width: width, height: hight)
        }else {
            let screenWidth = UIScreen.main.bounds.width
            var width = screenWidth
            var hight = screenWidth
            
            width = width >  413 ? 413 : width
            hight = hight > 340 ? 407 : hight
            
            return CGSize.init(width: width, height: hight)
        }
    }
}
