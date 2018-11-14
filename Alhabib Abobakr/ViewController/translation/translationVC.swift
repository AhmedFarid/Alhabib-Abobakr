//
//  translationVC.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit

class translationVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    var tripsd = [translationData]()
    
    @IBOutlet weak var Banners: UICollectionView!
    @IBOutlet weak var trips: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Banners.delegate = self
        Banners.dataSource = self
        
        trips.delegate = self
        trips.dataSource = self
        
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        
        API_translation.banner(urls: "http://alhabib-abobakr.com/api_elshekh/MainApp/api_token=222&lang=en&section=translation"){ (error: Error?, tripsd: [translationData]?) in
            if let tripsd = tripsd {
                self.tripsd = tripsd
                print("xxx\(self.tripsd)")
                self.trips.reloadData()
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
            return tripsd.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = Banners.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }else{
            if let cells = trips.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? translateCell {
                let inst = tripsd[indexPath.row]
                cells.configuerCell(prodect: inst)
                return cells
            }else{
                return translateCell()
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
            performSegue(withIdentifier: "suge", sender: tripsd[indexPath.row])
        }else {
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? translationDetialsVC{
            if let prodacet = sender as? translationData {
                distantion.singelItems = prodacet
                
            }
        }
    }
}
