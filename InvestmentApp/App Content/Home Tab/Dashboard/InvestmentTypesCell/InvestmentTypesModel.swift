//
//  InvestmentTypesModel.swift
//  InvestmentApp
//
//  Created by WEMA on 26/02/2024.
//

import Foundation


struct InvestmentTypesModel{
    func populateData() -> [InvestmentTypesProperties]{
        [
            InvestmentTypesProperties(investment: "Investment", subInvestment: "Start Investing Today", investmentTypes: "Group Investment, Stocks, Dollar, ..."),
            InvestmentTypesProperties(investment: "Investment", subInvestment: "Start Investing Today", investmentTypes: "Group Investment, Stocks, Dollar, ..."),
            InvestmentTypesProperties(investment: "Investment", subInvestment: "Start Investing Today", investmentTypes: "Group Investment, Stocks, Dollar, ...")
        ]
    }
}

struct InvestmentTypesProperties{
    let investment: String?
    let subInvestment: String?
    let investmentTypes: String?
}
