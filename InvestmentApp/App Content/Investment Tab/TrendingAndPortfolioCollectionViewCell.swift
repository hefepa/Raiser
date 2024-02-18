//
//  TrendingAndPortfolioCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 11/02/2024.
//

import UIKit

protocol TrendingAndPortFolioDelegate: AnyObject {
    func buttonTapped(at index: Int)
}

class TrendingAndPortfolioCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tAndPButton: UIButton!
    weak var delegate: TrendingAndPortFolioDelegate?
    var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tAndPButton.layer.borderWidth = 5
        tAndPButton.layer.borderColor = UIColor(.blue).cgColor
    }
    
    @IBAction func tAndPButtonTapped(_ sender: UIButton) {
        delegate?.buttonTapped(at: self.tag) // Assuming tag is set to the cell's index
       }
    
    func updateCell (with data: TrendingAndPortfolioProperties){
//        self.index = index
        tAndPButton.setTitle(data.tAndP, for: .normal)
    }
}
