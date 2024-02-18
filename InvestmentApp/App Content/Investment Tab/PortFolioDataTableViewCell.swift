//
//  PortFolioDataTableViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import UIKit

class PortFolioDataTableViewCell: UITableViewCell {

    @IBOutlet weak var investmentLabel: UILabel!
    @IBOutlet weak var clickHereLabel: UILabel!
    @IBOutlet weak var toGetStartedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(with data: PortFolioProperties){
        investmentLabel.text = data.investmentPortfolio
        clickHereLabel.text = data.clickHere
//        toGetStartedLabel.text = data.toGetStarted
    }
}
