//
//  TrendingAndPortfolioModel.swift
//  InvestmentApp
//
//  Created by WEMA on 11/02/2024.
//

import Foundation

struct TrendingAndPortfolioModel{
    func populateData() -> [TrendingAndPortfolioProperties]{
        [
            TrendingAndPortfolioProperties(tAndP: "Trending Stocks"),
            TrendingAndPortfolioProperties(tAndP: "My Portfolio")
        ]
    }
}

struct TrendingAndPortfolioProperties{
    let tAndP: String?
}
