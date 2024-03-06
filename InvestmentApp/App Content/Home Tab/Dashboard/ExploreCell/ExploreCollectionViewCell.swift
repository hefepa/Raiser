//
//  ExploreCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 26/02/2024.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var exploreImage: UIImageView!
    @IBOutlet weak var exploreNameLabel: UILabel!
    @IBOutlet weak var container: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        
        exploreNameLabel.font = .systemFont(ofSize: 10, weight: .regular)
        exploreNameLabel.textColor = .black
        
//        container.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)

        container.layer.shadowColor = UIColor.systemGray2.cgColor
        container.layer.shadowOpacity = 3
        container.layer.shadowOffset = CGSize(width: 2, height: 2)
        container.layer.shadowRadius = 3
    }
    
    func setupData(with data: ExploreProperties){
        exploreNameLabel.text = data.exploreName
        exploreImage.image = UIImage(named: data.exploreImage ?? "empty")
    }

}
