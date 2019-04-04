//
//  ChatViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/4/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class ChatViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .green
        tabBarController?.tabBar.isHidden = true
    }
}
