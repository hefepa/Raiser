//
//  SplashSreenCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import UIKit

class SplashSreenCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var raiserLabel: UILabel!
    @IBOutlet weak var raiserImage: UIImageView!
    weak var navigationController: UINavigationController!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(with data: SplashSreenProperties, index: Int, navigationController: UINavigationController){
        self.navigationController = navigationController
        raiserLabel.text = data.subRaiser
        raiserImage.image = UIImage(named: data.raiserPicture ?? "empty")
    }

}
