//
//  RecommendationCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 09/02/2024.
//

import UIKit

class RecommendationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recommendationScroll: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        recommendationScroll.backgroundColor =  UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
    }

}
