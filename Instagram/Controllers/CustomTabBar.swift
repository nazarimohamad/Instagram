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
        let homeController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        homeController.tabBarItem.title = "Home"
        homeController.tabBarItem.image = UIImage(named: "home")
        
        
        let navController = UINavigationController(rootViewController: viewController())
        navController.tabBarItem.title = "search"
        navController.tabBarItem.image = UIImage(named: "search")
        
        viewControllers = [homeController, navController, createDummyNavControllerWithTitle(title: "Add", imageName: "add"), createDummyNavControllerWithTitle(title: "Like", imageName: "like"), createDummyNavControllerWithTitle(title: "Profile", imageName: "profile")]
    }
    
    private func createDummyNavControllerWithTitle(title: String, imageName: String) -> UINavigationController {
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
}
