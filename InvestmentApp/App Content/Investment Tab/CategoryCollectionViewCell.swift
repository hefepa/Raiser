//
//  CategoryCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 09/02/2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(with data: CategoriesProperties){
        if let imageReceived = catImage{
            imageReceived.image = UIImage(named: data.catImage ?? "empty")
        }
        self.catName.text = data.catName
    }

}
