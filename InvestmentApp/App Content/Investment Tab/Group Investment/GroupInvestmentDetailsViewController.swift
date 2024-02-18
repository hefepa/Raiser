//
//  GroupInvestmentDetailsViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 17/02/2024.
//

import UIKit

class GroupInvestmentDetailsViewController: UIViewController {
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

    }
}
