//
//  TopPicksCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 02/03/2024.
//

import UIKit

class TopPicksCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topPicksImage: UIImageView!
    @IBOutlet weak var topPicksTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        topPicksImage.contentMode = .scaleAspectFill
        topPicksTitle.font = .systemFont(ofSize: 12, weight: .regular)
        
    }
    
    func setupData(with data: TopPicksProperties){
        topPicksImage.image = UIImage(named: data.imagePicks ?? "Empty")
        topPicksTitle.text = data.labelPicks
    }

}
