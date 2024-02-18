//
//  InvestmentCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 16/02/2024.
//

import UIKit

class InvestmentCollectionViewCell: UICollectionViewCell {
    
    var getData: JoinGroupProperties?
    
    
    @IBOutlet weak var amountToInvestLabel: UILabel!
    @IBOutlet weak var amountToInvestTF: UITextField!
    @IBOutlet weak var minimumImage: UIImageView!
    @IBOutlet weak var minimumLabel: UILabel!
    @IBOutlet weak var investTimeFrameLabel: UILabel!
    @IBOutlet weak var investTimeFrameTF: UITextField!
    @IBOutlet weak var expectedReturnsLabel: UILabel!
    @IBOutlet weak var expectedReturnsTF: UITextField!
    @IBOutlet weak var investButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //
        //        let contentOfRate = getData?.rate
        //
        //        // Split the sentence by spaces
        //        let components = contentOfRate?.components(separatedBy: " ")
        //        print(components)
        //        // Check if there are at least 1 space
        //        if components?.count ?? 0 >= 2 {
        //            // Join the components starting from the fourth element
        //            let contentAfterSecondSpace = components?[1...].joined(separator: " ")
        //            print(contentAfterSecondSpace)
        //            investTimeFrameTF.text = ("\(getData?.days ?? "0 day") " + (contentAfterSecondSpace ?? "0%"))
        //            print(investTimeFrameTF.text!)
        //        }
        propertiesAssigment()
    }
    
    func propertiesAssigment(){
        
        amountToInvestLabel.text = "What amount would you like to invest?"
        amountToInvestLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        amountToInvestTF.placeholder = "₦0.00"
        
        minimumImage.image = UIImage(named: "caution")
        minimumLabel.text = "Min. amount of ₦20,000 and Max amount of ₦100,000"
        minimumLabel.font = .systemFont(ofSize: 12, weight: .light)
        
        investTimeFrameLabel.text = "Tenure of Investment"
        investTimeFrameLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        investTimeFrameTF.isUserInteractionEnabled = false
        
        expectedReturnsLabel.text = "Expected Returns"
        expectedReturnsLabel.font = .systemFont(ofSize: 15, weight: .regular)
        expectedReturnsTF.placeholder = "₦0.00"
        
        investButton.setTitle("Invest", for: .normal)
        investButton.tintColor = .white
        btn.colorConfiguration(button: investButton)
        
    }
}
