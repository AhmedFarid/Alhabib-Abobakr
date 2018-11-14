//
//  peottryVC.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit

class peottryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    var petors = [peotryData]()
    
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
        
        API_Peotry.banner(urls: "http://alhabib-abobakr.com/api_elshekh/MainApp/api_token=222&lang=en&section=peotry"){ (error: Error?, petors: [peotryData]?) in
            if let petors = petors {
                self.petors = petors
                print("xxx\(self.petors)")
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
            return petors.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = Banners.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }else{
            if let cells = trips.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? peottryCells {
                let inst = petors[indexPath.row]
                cells.configuerCell(prodect: inst)
                return cells
            }else{
                return peottryCells()
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
            performSegue(withIdentifier: "suge", sender: petors[indexPath.row])
        }else {
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? peorttryDetilasVC{
            if let prodacet = sender as? peotryData {
                distantion.singelItems = prodacet
                
            }
        }
    }
}
