//
//  TabViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        tabBar.tintColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)

        let dashboardController = DashboardViewController()
        let learnController = LearnViewController()
        let investmentController = InvestmentViewController()
        let communityController = CommunityViewController()
//        let homeController = HomeViewController()
        let accountDetails = AccountDetailsViewController()
        
        dashboardController.tabBarItem.image = UIImage(named: "home")
        learnController.tabBarItem.image = UIImage(named: "books")
        investmentController.tabBarItem.image = UIImage(named: "trending")
        communityController.tabBarItem.image = UIImage(named: "person.crop.circle")
//        homeController.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        accountDetails.tabBarItem.image = UIImage(named: "card")

        
        dashboardController.tabBarItem.selectedImage = UIImage(named: "homefill")
        learnController.tabBarItem.selectedImage = UIImage(named: "bookfill")
        investmentController.tabBarItem.selectedImage = UIImage(named: "trendingfill")
        communityController.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        accountDetails.tabBarItem.selectedImage = UIImage(named: "cardfill")

        
        
        setViewControllers([UINavigationController(rootViewController: dashboardController), UINavigationController(rootViewController: learnController), UINavigationController(rootViewController: investmentController), UINavigationController(rootViewController: communityController), /*UINavigationController(rootViewController: homeController),*/ UINavigationController(rootViewController: accountDetails)], animated: true)

    }
}

extension TabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let navigationController = viewController as? UINavigationController {
            navigationController.popToRootViewController(animated: false)
        }
    }
}

