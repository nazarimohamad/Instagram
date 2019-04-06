//
//  ViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/3/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let storyCell = "storyCell"
    lazy var collectionViewOne: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let width = collectionView.frame.width
        let collectionViewOne = UICollectionView(frame: CGRect(x: 0, y: -35, width: width, height: 115), collectionViewLayout: layout)
        collectionViewOne.showsHorizontalScrollIndicator = false
        collectionViewOne.backgroundColor = .white
        return collectionViewOne
    }()

    let cardCell = "cardCell"
    lazy var collectionViewTwo: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let width = collectionView.frame.width
        let height = view.frame.height - 115
        let collectionViewTwo = UICollectionView(frame: CGRect(x: 0, y: 80, width: width, height: height), collectionViewLayout: layout)
        collectionViewTwo.backgroundColor = .white
        return collectionViewTwo
    }()
//
    
    func setupNavbar() {
        
        self.tabBarController?.navigationItem.title = "home"
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "message", style: .plain, target: self, action: #selector(showChatScreen))
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        setupNavbar()
        
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self

        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self

        collectionViewOne.register(StoryCell.self, forCellWithReuseIdentifier: storyCell)
        collectionViewTwo.register(CardCell.self, forCellWithReuseIdentifier: cardCell)


        collectionView.addSubview(collectionViewOne)
        collectionView.addSubview(collectionViewTwo)
    }

    @objc func showChatScreen() {
        let layout = UICollectionViewFlowLayout()
        let chatViewController = ChatViewController.init(collectionViewLayout: layout)
        self.tabBarController?.navigationController?.pushViewController(chatViewController, animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView == self.collectionViewOne {
            return 10
        } else {
            return 4
        }

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.collectionViewOne {
            let sCell = collectionViewOne.dequeueReusableCell(withReuseIdentifier: storyCell, for: indexPath as IndexPath)

            return sCell

        } else {
            let cCell = collectionViewTwo.dequeueReusableCell(withReuseIdentifier: cardCell, for: indexPath as IndexPath)

            return cCell
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewOne {
            return CGSize(width: 100, height: 115)
        } else {
            let height = (view.frame.height) - 195
            return CGSize(width: view.frame.width, height: height)
        }
    }
    
}



