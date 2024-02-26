//
//  GroupInvestmentDetailsViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 17/02/2024.
//

import UIKit

class GroupInvestmentDetailsViewController: UIViewController {
    
    var getData: PortFolioProperties?
    
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var startDateDetails: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var endDateDetails: UILabel!
    @IBOutlet weak var referenceNumber: UILabel!
    @IBOutlet weak var referenceNumberDetails: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var amountDetails: UILabel!
    @IBOutlet weak var amountInWords: UILabel!
    @IBOutlet weak var amountInWordsDetails: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var typeDetails: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        startDate.text = "Start Date"
        startDate.font = .systemFont(ofSize: 15, weight: .regular)
        endDate.text = "End Date"
        endDate.font = .systemFont(ofSize: 15, weight: .regular)
        referenceNumber.text = "Reference Number"
        referenceNumber.font = .systemFont(ofSize: 15, weight: .regular)
        amount.text = "Amount"
        amount.font = .systemFont(ofSize: 15, weight: .regular)
        amountInWords.text = "Amount in words"
        amountInWords.font = .systemFont(ofSize: 15, weight: .regular)
        type.text = "Type"
        type.font = .systemFont(ofSize: 15, weight: .regular)
        
        startDateDetails.font = .systemFont(ofSize: 15, weight: .regular)
        endDateDetails.font = .systemFont(ofSize: 15, weight: .regular)
        referenceNumberDetails.font = .systemFont(ofSize: 15, weight: .regular)
        amountDetails.font = .systemFont(ofSize: 15, weight: .regular)
        amountInWordsDetails.font = .systemFont(ofSize: 15, weight: .regular)
        typeDetails.font = .systemFont(ofSize: 15, weight: .regular)


        
        groupNameLabel.text = getData?.investmentName
        startDateDetails.text = getData?.createdAt
        endDateDetails.text = getData?.endDate
        referenceNumberDetails.text = getData?.referenceNumber
        amountDetails.text = getData?.amount?.description
        amountInWordsDetails.text = getData?.amountInWords
        typeDetails.text = getData?.investmentType
        
        
        
    }
}
