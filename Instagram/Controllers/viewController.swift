//
//  ViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/4/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class viewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "recent"
        tabBarController?.navigationItem.rightBarButtonItem = nil
        view.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
  
}
