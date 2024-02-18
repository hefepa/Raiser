//
//  AboutCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 16/02/2024.
//

import UIKit

class AboutCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var eligibilityLabel: UILabel!
    @IBOutlet weak var subEligibilityLabel: UILabel!
    @IBOutlet weak var whyInvestLabel: UILabel!
    @IBOutlet weak var subWhyInvestLabel: UILabel!
    @IBOutlet weak var benefitsLabel: UILabel!
    @IBOutlet weak var subBenefitsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        propertiesAssignment()
    }
    
    func propertiesAssignment(){
        
        eligibilityLabel.text = "Eligibility"
        eligibilityLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        subEligibilityLabel.text = "Open to individual investors contributing a minimum of ₦20,000 to collectively reach ₦5,000,000."
        subEligibilityLabel.font = .systemFont(ofSize: 14, weight: .light)
        
        whyInvestLabel.text = "Why Invest"
        whyInvestLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        subWhyInvestLabel.text = "Ideal for those with a modest budget seeking short-term gains over 90 days"
        subWhyInvestLabel.font = .systemFont(ofSize: 14, weight: .light)
        
        benefitsLabel.text = "Benefits"
        benefitsLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        subBenefitsLabel.text = "Participants can earn an attractive 8% return on their investment, making it a profitable venture for short-term financial goals."
        subBenefitsLabel.font = .systemFont(ofSize: 14, weight: .light)
    }

}
