//
//  HomeTopCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import UIKit

class HomeTopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topHomeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topHomeImage.layer.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor

    }
    
    func setUpData(with data: HomeTopProperties){
//        topHomeImage.image = UIImage(named: data.collectionImages ?? "empty")
    }

}
