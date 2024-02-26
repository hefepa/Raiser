//
//  TrendingStockViewModel.swift
//  InvestmentApp
//
//  Created by WEMA on 18/02/2024.
//


import Foundation

protocol TrendingStockModelDelegate: AnyObject {
    func didReceivedResponse(data: [TrendingStockPropertiesModel]?)
    func didReceiveError(error: String)
}

class TrendingStockViewModel {
    var trendingStocknetworkCall: TrendingStockNetworkCall
    
    init(trendingStocknetworkCall: TrendingStockNetworkCall) {
        self.trendingStocknetworkCall = trendingStocknetworkCall
    }
    
    weak var delegate: TrendingStockModelDelegate?
    
    func getTrendingStock() async {
        do {
            let trendingStockModel = try await trendingStocknetworkCall.fetchTrendngStock(url: URL(string: "https://bit-group-one-back-end.azurewebsites.net/api/GroupInvestment/Categories-Of-Interest")!)
            
            delegate?.didReceivedResponse(data: trendingStockModel)
            print("The trendingStocks are: \(trendingStockModel)")
        } catch {
            delegate?.didReceiveError(error: "An error occurred during data retrieval: \(error.localizedDescription)")
        }
    }
}
