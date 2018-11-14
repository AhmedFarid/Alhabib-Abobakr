//
//  institVC.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit

class institVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

   var instils = [institData]()
    
    @IBOutlet weak var item: UICollectionView!
    @IBOutlet weak var Banner: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        item.delegate = self
        item.dataSource = self
        
        Banner.delegate = self
        Banner.dataSource = self
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        
        API_Instit.banner(urls: "http://alhabib-abobakr.com/api_elshekh/MainApp/api_token=222&lang=en&section=instit"){ (error: Error?, instils: [institData]?) in
            if let instils = instils {
                self.instils = instils
                print("xxx\(self.instils)")
                self.item.reloadData()
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
            return instils.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = Banner.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                return cell
        }else{
            if let cells = item.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? institCll {
                let inst = instils[indexPath.row]
                cells.configuerCell(prodect: inst)
                return cells
            }else{
              return institCll()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
            let screenWidth = UIScreen.main.bounds.width
            var width = screenWidth
            var hight = screenWidth
            
            width = width > 320 ? 413 : width
            hight = hight > 164 ? 164 : hight
            
            return CGSize.init(width: width, height: hight)
        }else {
            let screenWidth = UIScreen.main.bounds.width
            var width = (screenWidth-30)/2
            
            width = width < 130 ? 160 : width
            
            return CGSize.init(width: width, height: width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
        }else if collectionView.tag == 1 {
            performSegue(withIdentifier: "suge", sender: instils[indexPath.row])
        }else {
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? institDetialsVC{
            if let prodacet = sender as? institData {
                distantion.singelItems = prodacet
                
            }
        }
    }
}
