//
//  TrendingDataTableViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import UIKit

class TrendingDataTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var trendingImage: UIImageView!
    @IBOutlet weak var trendingStockName: UILabel!
    @IBOutlet weak var trendingStockSubDetails: UILabel!
    @IBOutlet weak var trendingStockStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setupData(with data: TrendingStockProperties){
        trendingImage.image = UIImage(named: data.trendingImage ?? "empty")
        trendingStockName.text = data.trendingName
        trendingStockSubDetails.text = data.subTrendingName
        trendingStockStatus.text = data.stockStatus
        
        if let trendStockNum = trendingStockStatus.text {
            if trendStockNum.hasPrefix("-") {
                trendingStockStatus.textColor = UIColor(red: 0.804, green: 0.129, blue: 0.157, alpha: 1)
            }else {
                trendingStockStatus.textColor = UIColor(red: 0.05, green: 0.571, blue: 0.005, alpha: 1)
            }
        }
    }
}
