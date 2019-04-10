//
//  CustomTabBar.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/4/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let hController = HomeController(collectionViewLayout: layout)
        let homeController = UINavigationController.init(rootViewController: hController)
        homeController.tabBarItem.title = "Home"
        homeController.tabBarItem.image = UIImage(named: "home")
        
        
        let navController = UINavigationController(rootViewController: viewController())
        navController.tabBarItem.title = "search"
        navController.tabBarItem.image = UIImage(named: "people")
        
        let contactController = UINavigationController(rootViewController: contactViewController())
        contactController.tabBarItem.title = "contact"
        contactController.tabBarItem.image = UIImage(named: "people")
        
        viewControllers = [homeController, navController, contactController, createDummyNavControllerWithTitle(title: "Add", imageName: "home" ), createDummyNavControllerWithTitle(title: "Profile", imageName: "setting")]
    }
    
    private func createDummyNavControllerWithTitle(title: String, imageName: String) -> UINavigationController {
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
}
