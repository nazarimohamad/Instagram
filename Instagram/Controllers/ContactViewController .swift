//
//  ContactViewController .swift
//  Instagram
//
//  Created by Ryan Nazari on 4/7/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class contactViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "contact"
        tabBarController?.navigationItem.rightBarButtonItem = nil
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUpperView()
    }
    
}
