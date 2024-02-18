//
//  PortFolioModel.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import Foundation

struct PortFolioModel{
    func populateData() -> [PortFolioProperties]{
        [
            PortFolioProperties(investmentPortfolio: "Your Investment portfolio is empty now", clickHere: "Click here to get started")
        ]
    }
}

struct PortFolioProperties{
    let investmentPortfolio: String?
    let clickHere: String?
//    let toGetStarted: String?
}
