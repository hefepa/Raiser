//
//  InvestmentTypesCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 26/02/2024.
//

import UIKit

class InvestmentTypesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var investmentLabel: UILabel!
    @IBOutlet weak var subInvestmentLabel: UILabel!
    @IBOutlet weak var investmentTypesLabel: UILabel!
    @IBOutlet weak var viewMoreLabel: UILabel!
    @IBOutlet weak var collectionBackground: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        
        investmentLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        investmentLabel.textColor = .white
        
        subInvestmentLabel.font = .systemFont(ofSize: 12, weight: .regular)
        subInvestmentLabel.textColor = .white
        
        investmentTypesLabel.font = .systemFont(ofSize: 12, weight: .regular)
        investmentTypesLabel.textColor = .white
        
        viewMoreLabel.text = "View More"
        viewMoreLabel.font = .systemFont(ofSize: 12, weight: .regular)
        viewMoreLabel.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        
        collectionBackground.image = UIImage(named: "background")
        collectionBackground.contentMode = .scaleAspectFill

        
        
    }
    
    func setupData(with data: InvestmentTypesProperties){
        investmentLabel.text = data.investment
        subInvestmentLabel.text = data.subInvestment
        investmentTypesLabel.text = data.investmentTypes
    }

}
