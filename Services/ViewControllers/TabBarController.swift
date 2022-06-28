//
//  ViewController.swift
//  Services
//
//  Created by AnnaEvgen on 14.05.2022.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        tabBar.tintColor = .green
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowRadius = 5
        self.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBar.layer.borderWidth = 0
        self.tabBar.clipsToBounds = false
        self.tabBar.backgroundColor = UIColor.systemBackground
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().barTintColor = .systemBackground
        setupVCs()
//        setupNavControllerBar()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: NewOrderViewController(), title: NSLocalizedString("Создать заказ", comment: ""), image: UIImage(systemName: "plus.circle")!),
            createNavController(for: MyOrdersViewController(), title: NSLocalizedString("Мои заказы", comment: ""), image: UIImage(systemName: "house")!),
        ]
    }
    
//    func setupNavControllerBar() {
//
//        navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
//        navigationController?.navigationBar.layer.shadowOpacity = 0.4
//        navigationController?.navigationBar.layer.shadowOffset = .zero
//        navigationController?.navigationBar.layer.shadowRadius = 3
//        navigationController?.navigationBar.backgroundColor = .systemBackground
//
//    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationBar.backgroundColor = .systemBackground
        navController.navigationBar.layer.masksToBounds = false
        
        rootViewController.navigationItem.title = title
        return navController
    }
    
}
