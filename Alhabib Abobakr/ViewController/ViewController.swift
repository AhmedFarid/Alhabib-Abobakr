//
//  ViewController.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/13/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    
    var CatList = Array<CatIten>()
    var bannrData = [BannerData]()
    
    @IBOutlet weak var collectionCat: UICollectionView!
    @IBOutlet weak var collectionBanner: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionCat.delegate = self
        collectionCat.dataSource = self
        
        collectionBanner.delegate = self
        collectionBanner.dataSource = self
        

        
        ReadTheCat()
        handleRefresh() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleRefresh()
    }
    
    
    @objc private func handleRefresh() {
        
        API_Banner.banner { (error: Error?, bannrData: [BannerData]?) in
            if let bannrData = bannrData {
                self.bannrData = bannrData
                print("xxx\(self.bannrData)")
                self.collectionBanner.reloadData()
            }
        }
    }
    
    
    func  ReadTheCat(){
        let bath = Bundle.main.path(forResource: "Cats", ofType: "plist")!
        let url = URL(fileURLWithPath: bath)
        let data = try! Data(contentsOf: url)
        let plist =  try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        let dictArry = plist as! [[String:String]]
        for dic  in dictArry {
            CatList.append(CatIten(catName: dic["Catname"] ?? "", catImge: dic["CatImage"] ?? ""))
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
            return bannrData.count
        }else{
            return CatList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            if  let cell = collectionBanner.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? bannerCell{
                let banner = bannrData[indexPath.row]
                cell.configuerCell(prodect: banner)
                return cell
            }else{
                return bannerCell()
            }
        }
        else{
            let cells: catCell = collectionCat.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! catCell
            cells.label.text = CatList[indexPath.row ].catName!
            cells.image.image = UIImage(named: CatList[indexPath.row ].catImge!)
            return cells
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
            if CatList[indexPath.row].catImge == "1" {
               self.performSegue(withIdentifier: "suge", sender: nil)
            }else if CatList[indexPath.row].catImge == "2"{
                self.performSegue(withIdentifier: "suge2", sender: nil)
            }else if CatList[indexPath.row].catImge == "3"{
                self.performSegue(withIdentifier: "suge3", sender: nil)
            }else if CatList[indexPath.row].catImge == "4"{
                self.performSegue(withIdentifier: "suge4", sender: nil)
            }else if CatList[indexPath.row].catImge == "5"{
                self.performSegue(withIdentifier: "suge5", sender: nil)
            }else if CatList[indexPath.row].catImge == "7"{
                self.performSegue(withIdentifier: "suge7", sender: nil)
            }else{
                print("done")
            }
        }
}

