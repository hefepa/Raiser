//
//  ALATEcosystemCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 25/02/2024.
//

import UIKit

class ALATEcosystemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var collectionImage: UIImageView!
    
    weak var navigationController: UINavigationController!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstLabel.font = .systemFont(ofSize: 20, weight: .bold)
        secondLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        secondLabel.textColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)

        
    }
    
    func setupData(with data: ALATEcosystemCollectionCellProperties){
        firstLabel.text = data.firstText
        secondLabel.text = data.secondText
        collectionImage.image = UIImage(named: data.collectionImage ?? "empty")
    }

}
