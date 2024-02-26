//
//  HomeTopCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import UIKit

class HomeTopCollectionViewCell: UICollectionViewCell {
    var getData: HomeTopProperties?
    @IBOutlet weak var topHomeImage: UIImageView!
    @IBOutlet weak var raiserInvestmentTypeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var viewInvestmentLabel: UILabel!
    @IBOutlet weak var hideAmountImage: UIImageView!
    @IBOutlet weak var container: UIView!

//    var dataAccessor: HomeTopProperties = HomeTopModel().populateData()
    var isAmountVisible = false
    var isTextHidden = false

    var originalBalance: String?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        container.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7).cgColor
        raiserInvestmentTypeLabel.textColor = .white
        raiserInvestmentTypeLabel.font = .systemFont(ofSize: 15, weight: .regular)
        amountLabel.textColor = .white
        amountLabel.font = .systemFont(ofSize: 20, weight: .semibold)

        topHomeImage.contentMode = .scaleAspectFill
        hideAmountImage.image = UIImage(named: "eyeslash")
        
    

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        hideAmountImage.isUserInteractionEnabled = true
        hideAmountImage.addGestureRecognizer(tapGestureRecognizer)


    }

    @objc func imageTapped() {
            if let originalBalance = originalBalance {
                // If originalBalance is set, it means the balance is currently asterisked
                amountLabel.text = originalBalance
                self.originalBalance = nil
            } else {
                // If originalBalance is not set, it means the balance is not asterisked
                originalBalance = amountLabel.text
                amountLabel.text = String(repeating: "*", count: originalBalance?.count ?? 0)
            }
        }
    
    func setUpData(with data: HomeTopProperties){
        topHomeImage.image = UIImage(named: data.collectionImages ?? "empty")
        raiserInvestmentTypeLabel.text = data.investmentName
        amountLabel.text = data.amountInAnInvestment
        viewInvestmentLabel.text = data.viewInvestment
        
    }

}
