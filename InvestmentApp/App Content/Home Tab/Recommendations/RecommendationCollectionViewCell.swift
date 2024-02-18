//
//  RecommendationCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 09/02/2024.
//

import UIKit

class RecommendationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recommendationImage: UIImageView!
    @IBOutlet weak var recommendationNameLabel: UILabel!
    @IBOutlet weak var recommendationInvestLabel: UILabel!
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var recommendationScroll: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        recommendationScroll.backgroundColor =  UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
        recommendationImage.contentMode = .scaleAspectFit
        recommendationNameLabel.textColor = .white
        recommendationInvestLabel.textColor = .white
        container.backgroundColor = UIColor(red: 0.804, green: 0.129, blue: 0.157, alpha: 1)
        container.layer.cornerRadius = 3

        
    }
    
    func setupData(with data: RecommendationProperties){
        recommendationImage.image = UIImage(named: data.image ?? "empty")
        recommendationNameLabel.text = data.recommendationName
        recommendationInvestLabel.text = data.investNow
    }
}

