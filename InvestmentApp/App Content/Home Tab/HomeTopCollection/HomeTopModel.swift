//
//  HomeTopModel.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import Foundation

struct HomeTopModel{
    func populateData() -> [HomeTopProperties] {
        [
           HomeTopProperties(collectionImages: "raiserbackground", investmentName: "Raiser Investments", amountInAnInvestment: "₦1,080,930.00", viewInvestment: "View Investments"),
           HomeTopProperties(collectionImages: "raiserbackground", investmentName: "Raiser Vault Savings", amountInAnInvestment: "₦390,010.00", viewInvestment: "View Investments"),
           HomeTopProperties(collectionImages: "raiserbackground", investmentName: "Raiser Flexi Savings", amountInAnInvestment: "₦18,450.00", viewInvestment: "View Investments")
        ]
    }
}


struct HomeTopProperties{
    let collectionImages: String?
    let investmentName: String?
    let amountInAnInvestment: String?
    let viewInvestment: String
}
