//
//  NavigationBar.swift
//  InvestmentApp
//
//  Created by WEMA on 14/02/2024.
//

import Foundation
import UIKit

import UIKit

class NavigationBar {
    
    private let navigationItem: UINavigationItem
    
    init(navigationItem: UINavigationItem) {
        self.navigationItem = navigationItem
    }
    
    func learnNavigation(image: UIImage? = nil, titleText: String? = nil) {
        
        let customTitleView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        customTitleView.addSubview(imageView)
        
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        titleLabel.textColor = UIColor.black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        customTitleView.addSubview(titleLabel)
        
        // Center the imageView and titleLabel horizontally within customTitleView
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: customTitleView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: customTitleView.leadingAnchor, constant: 150),
            
            titleLabel.centerYAnchor.constraint(equalTo: customTitleView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8) // Adjust spacing as needed
        ])
        
        // Ensure that the customTitleView's frame matches its content size
        customTitleView.sizeToFit()
        
        navigationItem.titleView = customTitleView
    }
}

