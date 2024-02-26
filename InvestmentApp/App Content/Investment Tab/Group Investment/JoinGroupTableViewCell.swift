//
//  JoinGroupTableViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 14/02/2024.
//

import UIKit
import Kingfisher

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
    
    func setupManualData(with data: JoinGroupManualProperties){
        if let progressStatusgroup = data.progress{
            groupProgressBar.progress = progressStatusgroup
         }
         groupPercentageLeft.text = data.percentageLeft
    }
    
    func setupData(with data: JoinGroupProperties) {
        var groupRateTargetAmount: String?
        var groupRateInterest: String?

        
        
        
        groupName.text = data.name
        let url = URL(string: data.url ?? "Empty")
        groupImage?.kf.setImage(with: url)

        if let rate = data.interestRate {
            groupRate.text = String(rate)
            groupRateInterest = groupRate.text
        } else {
            groupRate.text = nil
        }

        if let days = data.duration {
            groupDays.text = String("\(days) days")
        } else {
            groupDays.text = nil
        }

        if let targetAmount = data.maximumCapital {
            groupRateTargetAmount = String(targetAmount)
        }
        
        let targetAmountText = groupRateTargetAmount ?? "₦0.00"
        let interestText = groupRateInterest ?? "0 %"
//        let formattedNumber = formatCurrency("\(targetAmountText)")

        
        func formatCurrency(_ value: Double) -> String {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.currencySymbol = "₦"
            numberFormatter.minimumFractionDigits = 2
            
            return numberFormatter.string(from: NSNumber(value: value)) ?? "₦0.00"
        }
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .decimal
//        numberFormatter.locale = Locale.current // or set to your desired locale
//
//        if let formattedNumber = numberFormatter.string(from: NSNumber(value: targetAmountText)) {
//            print(formattedNumber)  // Output: 1,000,000
//        }
        

        print(groupRate.text = "₦\(targetAmountText) at \(interestText)%")
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    func setupData(with data: JoinGroupProperties){
//        groupImage.image = UIImage(named: data.img ?? "empty")
//        groupName.text = data.name
//        groupRate.text = data.rate
//        if let progressStatusgroup = data.progress{
//            groupProgressBar.progress = progressStatusgroup
//        }
//        groupPercentageLeft.text = data.percentageLeft
//        groupDays.text = data.days
//    }
    
//    func setupData(with data: JoinGroupProperties){
//        
//        var groupRateTargetAmount: String?
//        var groupRateInterest: String?
//
//        groupName.text = data.name
//        if let rate = data.interestRate{
//            groupRate.text = String(rate)
//            groupRateInterest = groupRate.text
//        }else{
//            groupRate.text = nil
//        }
//        
//        if let days = data.duration{
//            groupDays.text = String(days)
//        }else{
//            groupDays.text = nil
//        }
//        
//        if let targetAmount = data.maximumCapital{
//            groupRate.text = String(targetAmount)
//            groupRateTargetAmount = groupRate.text
//        }
//        
//        groupRate.text = ("\(groupRateTargetAmount ?? "₦0.00")" + "at" +  "\(groupRateInterest ?? "0 %")")
//        
//        
//        
//        let url = URL(string: (data.url!))
//        groupImage.kf.setImage(with: url)
//    }
//    
}
