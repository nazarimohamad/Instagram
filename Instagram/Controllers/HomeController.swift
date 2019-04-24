//
//  ViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/3/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    
    var posts: [Post]?
    var story: [Story]?
    
    func setupStory() {
        
        let steve = Story()
        steve.storyName = "steve"
        steve.storyImageName = "steve"
        
        let elon = Story()
        elon.storyName = "elon"
        elon.storyImageName = "elon"
        
        let mark = Story()
        mark.storyName = "mark"
        mark.storyImageName = "mark"
        
        let elon1 = Story()
        elon1.storyName = "elon"
        elon1.storyImageName = "elon"
        
        let elon2 = Story()
        elon2.storyName = "elon"
        elon2.storyImageName = "elon"
        
        let elon3 = Story()
        elon3.storyName = "elon"
        elon3.storyImageName = "elon"
        
        story = [steve, elon, mark, elon1, elon2, elon3]
    }
   
    
    
    
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
        let height = view.frame.height
        let collectionViewTwo = UICollectionView(frame: CGRect(x: 0, y: 80, width: width, height: height), collectionViewLayout: layout)
        collectionViewTwo.backgroundColor = .white
        return collectionViewTwo
    }()
    
    func fetchPosts() {

        FetchImagePosts.shareInstant.fetchPosts { (posts: [Post]) in
            
            self.posts = posts
            self.collectionViewTwo.reloadData()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "home"
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "message", style: .plain, target: self, action: #selector(showChatScreen))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        setupStory()
        fetchPosts()
        
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
        let chatViewController = ChatListViewController.init(collectionViewLayout: layout)
        self.tabBarController?.navigationController?.pushViewController(chatViewController, animated: true)
    }
    
}



extension HomeController: UICollectionViewDelegateFlowLayout {
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionViewOne {
            return story?.count ?? 0
        } else if collectionView == self.collectionViewTwo {
            return posts?.count ?? 0
        } else {
            return 0
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionViewOne {
            let sCell = collectionViewOne.dequeueReusableCell(withReuseIdentifier: storyCell, for: indexPath as IndexPath) as! StoryCell
            sCell.story = story?[indexPath.item]
            return sCell
            
        } else if collectionView == self.collectionViewTwo {
            let cCell = collectionViewTwo.dequeueReusableCell(withReuseIdentifier: cardCell, for: indexPath as IndexPath) as! CardCell
            cCell.post = posts?[indexPath.item]
            return cCell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewOne {
            return CGSize(width: 100, height: 115)
        } else {
            let height = (view.frame.height) - 175
            return CGSize(width: view.frame.width, height: 485)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewOne {
            let controller = StoryViewController()
            controller.storyImage = story?[indexPath.item]
            self.present(controller, animated: true, completion: nil)
//            let storyImage = StoryImage()
//            storyImage.showStoryImage()
            
        }
    }

}
