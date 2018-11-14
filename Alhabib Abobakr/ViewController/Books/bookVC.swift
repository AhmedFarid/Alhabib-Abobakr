//
//  bookVC.swift
//  Alhabib Abobakr
//
//  Created by Ahmed Farido on 11/14/18.
//  Copyright © 2018 Ahmed Farido. All rights reserved.
//

import UIKit

class bookVC: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    
    var books = [booksData]()
    
    @IBOutlet weak var banner: UICollectionView!
    @IBOutlet weak var booksss: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        banner.delegate = self
        banner.dataSource = self
        
        booksss.delegate = self
        booksss.dataSource = self
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        
        API_Books.banner(urls: "http://alhabib-abobakr.com/api_elshekh/MainApp/api_token=222&lang=en&section=book"){ (error: Error?, books: [booksData]?) in
            if let books = books {
                self.books = books
                print("xxx\(self.books)")
                self.booksss.reloadData()
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
            return books.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = banner.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }else{
            if let cells = booksss.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? booksCell {
                let inst = books[indexPath.row]
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
            performSegue(withIdentifier: "suge", sender: books[indexPath.row])
        }else {
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? BooksDetialsVC{
            if let prodacet = sender as? booksData {
                distantion.singelItems = prodacet
            }
        }
    }
}
