//
//  ChatViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/4/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class ChatViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let cellId = "cellId"
    let headerId = "headerId"
    
    var messages: [Message]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Message"
        collectionView.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
        collectionView.register(ChatListCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(SearchBar.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        setupMessageData()
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize (width: collectionView.frame.width, height: 50)
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! SearchBar
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatListCell
        if let message = messages?[indexPath.item] {
            cell.message = message
        }
          return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 70)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let viewController = MessageViewController(collectionViewLayout: layout)
        viewController.friend = messages?[indexPath.item].friend
      navigationController?.pushViewController(viewController, animated: true)
    }
}
