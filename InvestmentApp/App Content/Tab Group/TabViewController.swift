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
        
        tabBar.tintColor = .green
        let homeController = HomeViewController()
        let learnController = LearnViewController()
        let analyzeController = AnalyzeViewController()
        let investmentController = InvestmentViewController()
        
        homeController.tabBarItem.image = UIImage(named: "home")
        learnController.tabBarItem.image = UIImage(named: "books")
        analyzeController.tabBarItem.image = UIImage(named: "trending")
        investmentController.tabBarItem.image = UIImage(named: "card")
        
        homeController.tabBarItem.selectedImage = UIImage(named: "homefill")
        learnController.tabBarItem.selectedImage = UIImage(named: "bookfill")
        analyzeController.tabBarItem.selectedImage = UIImage(named: "trendingfill")
        investmentController.tabBarItem.selectedImage = UIImage(named: "cardfill")
        
        
        setViewControllers([UINavigationController(rootViewController: homeController), UINavigationController(rootViewController: learnController), UINavigationController(rootViewController: analyzeController), UINavigationController(rootViewController: investmentController)], animated: true)

    }
    

}
