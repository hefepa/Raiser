//
//  LearnNavigation.swift
//  InvestmentApp
//
//  Created by WEMA on 14/02/2024.
//

import Foundation
import UIKit

class LearnNavigation: UIView {
    @IBOutlet private var backButtonImageView: UIImageView!
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    
    // Add any necessary code to configure your custom view
    
    // Example function to set the title and images
    func configure(title: String, backImage: UIImage?, iconImage: UIImage?) {
        backButtonImageView.image = backImage
        iconImageView.image = iconImage
        titleLabel.text = title
    }
}
