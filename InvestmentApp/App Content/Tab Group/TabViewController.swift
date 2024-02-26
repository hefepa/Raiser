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

        let homeController = HomeViewController()
        let learnController = LearnViewController()
        let analyzeController = AnalyzeViewController()
        let investmentController = InvestmentViewController()
        
        homeController.tabBarItem.image = UIImage(named: "home")
        learnController.tabBarItem.image = UIImage(named: "books")
        investmentController.tabBarItem.image = UIImage(named: "trending")
        analyzeController.tabBarItem.image = UIImage(named: "card")

        
        homeController.tabBarItem.selectedImage = UIImage(named: "homefill")
        learnController.tabBarItem.selectedImage = UIImage(named: "bookfill")
        investmentController.tabBarItem.selectedImage = UIImage(named: "trendingfill")
        analyzeController.tabBarItem.selectedImage = UIImage(named: "cardfill")

        
        
        setViewControllers([UINavigationController(rootViewController: homeController), UINavigationController(rootViewController: learnController), UINavigationController(rootViewController: investmentController), UINavigationController(rootViewController: analyzeController)], animated: true)

    }
}

extension TabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let navigationController = viewController as? UINavigationController {
            navigationController.popToRootViewController(animated: false)
        }
    }
}

