//
//  WalletCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 27/02/2024.
//

import UIKit

class WalletCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var walletImage: UIImageView!
    @IBOutlet weak var walletNameLabel: UILabel!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        walletNameLabel.font = .systemFont(ofSize: 10, weight: .regular)
        walletNameLabel.textColor = .black
    }
    
    func setupData(with data: WalletProperties){
        walletImage.image = UIImage(named: "\(data.walletImage!)")
        walletNameLabel.text = data.walletName
    }

}
