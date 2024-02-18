//
//  VerificationCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import UIKit

class VerificationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var verificationCell: UIView!
    @IBOutlet weak var verificationLabelAction: UILabel!
    @IBOutlet weak var verificationImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        verificationCell.layer.cornerRadius = 3
//        verificationCell.layer.borderWidth = 1.0
//        verificationCell.layer.borderColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1).cgColor
        
        verificationCell.backgroundColor = UIColor.white

        verificationCell.layer.shadowColor = UIColor.black.cgColor
        verificationCell.layer.shadowOpacity = 0.5
        verificationCell.layer.shadowOffset = CGSize(width: 0, height: 2)
        verificationCell.layer.shadowRadius = 2
    }
    
    func setupData(with data: VerificationUpdatesProperties){
        verificationLabelAction.text = data.verificationAction
        verificationImage.image = UIImage(named: data.verificationImage ?? "empty")
    }
    

}
