//
//  LearnTableViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 06/02/2024.
//

import UIKit

class LearnTableViewCell: UITableViewCell {
    @IBOutlet weak var learnImages: UIImageView!
    @IBOutlet weak var learnHeadings: UILabel!
    @IBOutlet weak var learnSubHead: UILabel!
    @IBOutlet weak var container: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        learnHeadings.font = UIFont(name: "Inter-Medium", size: 14)
        
        learnSubHead.textColor = UIColor(red: 0.102, green: 0.102, blue: 0.102, alpha: 0.5)
        learnSubHead.font = UIFont(name: "Inter-Regular", size: 12)
        
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.2
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 4

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(with data: LearnProperties){
        learnImages.image = UIImage(named: data.images ?? "empty")
        learnHeadings.text = data.heading
        learnSubHead.text = data.subHeading
    }
    
}
