//
//  JoinGroupTableViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 14/02/2024.
//

import UIKit
let button = ButtonColor()
class JoinGroupTableViewCell: UITableViewCell {
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupRate: UILabel!
    @IBOutlet weak var groupProgressBar: UIProgressView!
    @IBOutlet weak var groupPercentageLeft: UILabel!
    @IBOutlet weak var groupDays: UILabel!
    @IBOutlet weak var joinGroup: UIButton!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        groupName.textColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)
        groupName.font = .systemFont(ofSize: 17, weight: .regular)
        groupRate.font = .systemFont(ofSize: 15, weight: .regular)
        groupPercentageLeft.font = .systemFont(ofSize: 15, weight: .regular)
        groupDays.font = .systemFont(ofSize: 15, weight: .regular)
        joinGroup.tintColor = .white
        joinGroup.backgroundColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)
        groupProgressBar.progressTintColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupData(with data: JoinGroupProperties){
        groupImage.image = UIImage(named: data.img ?? "empty")
        groupName.text = data.name
        groupRate.text = data.rate
        if let progressStatusgroup = data.progress{
            groupProgressBar.progress = progressStatusgroup
        }
        groupPercentageLeft.text = data.percentageLeft
        groupDays.text = data.days
    }
    
}
