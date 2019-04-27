//
//  CustomTabBar.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/4/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import Firebase


class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
            let layout = UICollectionViewFlowLayout()
            let hController = HomeController(collectionViewLayout: layout)
            let homeController = UINavigationController.init(rootViewController: hController)
            homeController.tabBarItem.image = UIImage(named: "home")
            homeController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            
            
            let navController = UINavigationController(rootViewController: viewController())
            navController.tabBarItem.image = UIImage(named: "search")
            navController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            
            let contactController = UINavigationController(rootViewController: contactViewController())
            contactController.tabBarItem.image = UIImage(named: "profile")
            contactController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
            
        viewControllers = [homeController, navController, createDummyNavControllerWithTitle(imageName: "add" ), createDummyNavControllerWithTitle(imageName: "bigHeart"), contactController]
 

    }
    
    private func createDummyNavControllerWithTitle(imageName: String) -> UINavigationController {
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        return navController
    }
}
