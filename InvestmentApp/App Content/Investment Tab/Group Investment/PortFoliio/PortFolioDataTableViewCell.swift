//
//  PortFolioDataTableViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import UIKit

protocol PortFolioTableDelegate: AnyObject {
//    func didTapButton(inCell cell: PortFolioDataTableViewCell)
    func didTapButton(inCell cell: PortFolioDataTableViewCell, data: PortFolioProperties?)

}

class PortFolioDataTableViewCell: UITableViewCell {
    
    weak var delegate: PortFolioTableDelegate?
    var getData: PortFolioProperties?

    
    @IBOutlet weak var investmentNameLabel: UILabel!
    @IBOutlet weak var minInvestment: UILabel!
    @IBOutlet weak var amountInvestedLabel: UILabel!
    @IBOutlet weak var returnsLabel: UILabel!
    @IBOutlet weak var ratePerInvestment: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var subStatusLabel: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var viewButton: UIButton!

    var onViewButtonTapped: (() -> Void)?


    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        investmentNameLabel.font = .systemFont(ofSize: 15, weight: .medium)
        
        minInvestment.text = "Min. Investment"
        minInvestment.font = .systemFont(ofSize: 12, weight: .light)
        
        amountInvestedLabel.font = .systemFont(ofSize: 15, weight: .regular)
        ratePerInvestment.font = .systemFont(ofSize: 15, weight: .regular)
        subStatusLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        returnsLabel.text = "Return"
        returnsLabel.font = .systemFont(ofSize: 12, weight: .light)
        
        
        statusLabel.text = "Status"
        statusLabel.font = .systemFont(ofSize: 12, weight: .light)

        container.layer.cornerRadius = 2
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: 2, height: 2)
        container.layer.shadowRadius = 10
        
        viewButton.layer.borderWidth = 1.0
        viewButton.layer.borderColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1).cgColor
    }
    
    @IBAction func viewButtonClicked(_ sender: UIButton) {
//        delegate?.didTapButton(inCell: self)     
        onViewButtonTapped?()
        NotificationCenter.default.post(name: Notification.Name("nav"), object: nil)
        print("Get data is: \(getData)")
        delegate?.didTapButton(inCell: self, data: getData)

    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpData(with data: PortFolioProperties){
        investmentNameLabel.text = data.investmentName
        if let amount = data.amount{
            amountInvestedLabel.text = "₦\(amount)"

        }
        subStatusLabel.text = data.status
        
        if let ratePercentage = data.interestRate, let days = data.duration{
            ratePerInvestment.text = "\(ratePercentage)% at \(days) days"
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            delegate?.didSelectCell(inCell: self)
//        }
}
