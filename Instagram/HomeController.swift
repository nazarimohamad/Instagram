//
//  ViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/3/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    let storyCell = "storyCell"
    lazy var collectionViewOne: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionViewOne = UICollectionView(frame: CGRect(x: 0, y: 70, width: 375, height: 125), collectionViewLayout: layout)
        collectionViewOne.showsHorizontalScrollIndicator = false
        collectionViewOne.backgroundColor = .white
        return collectionViewOne
    }()
    
    let cardCell = "cardCell"
    lazy var collectionViewTwo: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionViewTwo = UICollectionView(frame: CGRect(x: 0, y: 230, width: 375, height: 250), collectionViewLayout: layout)
        collectionViewTwo.backgroundColor = .white
        return collectionViewTwo
    }()
    
    
    var myArray = ["1", "2", "3", "4"]
    var myArray2 = ["3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
        
        collectionViewOne.register(StoryCell.self, forCellWithReuseIdentifier: storyCell)
        collectionViewTwo.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cardCell)
        
        
        
        view.addSubview(collectionViewOne)
        view.addSubview(collectionViewTwo)
//        handleHorizentalScroll()
    }

//    func handleHorizentalScroll() {
//        if let flowLayout = collectionViewOne.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.scrollDirection = .horizontal
////            flowLayout.minimumLineSpacing = 0
//        }
//    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionViewOne {
            return 10
        } else {
            return myArray2.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionViewOne {
            let sCell = collectionViewOne.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath as IndexPath)
            sCell.backgroundColor = UIColor.white

            return sCell

        } else {

            let cCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath as IndexPath)

            cCell.backgroundColor = UIColor.blue

            return cCell
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewOne {
            return CGSize(width: 100, height: 125)
        } else {
            let height = (view.frame.width * 9/16) + 40
            return CGSize(width: view.frame.width, height: height)
        }
    }
    
}



