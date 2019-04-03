//
//  ViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/3/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let MyCell = "MyCell"
    lazy var collectionViewOne: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionViewOne = UICollectionView(frame: CGRect(x: 0, y: 40, width: 300, height: 100), collectionViewLayout: layout)
//        collectionViewOne.backgroundColor = .white
        return collectionViewOne
    }()
    
    let MyCell2 = "MyCell2"
    lazy var collectionViewTwo: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionViewTwo = UICollectionView(frame: CGRect(x: 0, y: 390, width: 200, height: 100), collectionViewLayout: layout)
//        collectionViewTwo.backgroundColor = .white
        return collectionViewTwo
    }()
    
    
    var myArray = ["1", "2"]
    var myArray2 = ["3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
        
        collectionViewOne.register(UICollectionViewCell.self, forCellWithReuseIdentifier: MyCell)
        collectionViewTwo.register(UICollectionViewCell.self, forCellWithReuseIdentifier: MyCell2)
        
        view.addSubview(collectionViewOne)
        view.addSubview(collectionViewTwo)
//        handleHorizentalScroll()
    }
//
//    func handleHorizentalScroll() {
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.scrollDirection = .horizontal
//            flowLayout.minimumLineSpacing = 0
//        }
//    }
//
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionViewOne {
            return myArray.count
        } else {
            return myArray2.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionViewOne {
            let myCell = collectionViewOne.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath)

            myCell.backgroundColor = UIColor.red

            return myCell

        } else {

            let myCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell2", for: indexPath as IndexPath)

            myCell2.backgroundColor = UIColor.blue

            return myCell2
        }
    
    }
}



