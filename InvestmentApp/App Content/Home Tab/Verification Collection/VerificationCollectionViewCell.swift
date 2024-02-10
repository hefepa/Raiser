//
//  VerificationCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import UIKit

class VerificationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var verificationCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        verificationCell.layer.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
    }

}
