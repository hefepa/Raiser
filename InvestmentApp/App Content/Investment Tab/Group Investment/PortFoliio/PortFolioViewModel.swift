//
//  PortFolioViewModel.swift
//  InvestmentApp
//
//  Created by WEMA on 21/02/2024.
//

import Foundation

protocol PortfolioModelDelegate: AnyObject {
    func didReceivedResponse(data: PortFolioResponseModel?)
    func didReceiveError(error: String)
    
}


class PortFolioViewModel {
    var portfolioNetworkCall: PortFolioNetworkCall
    
    init(portfolioNetworkCall: PortFolioNetworkCall = PortFolioNetworkCall()) {
        self.portfolioNetworkCall = portfolioNetworkCall
    }
    
    weak var delegate: PortfolioModelDelegate?
    
    let userID = UserDefaults.standard.integer(forKey: "UserID")
    
    func getPortFolio() async {
        do {
            let portfolioModel = try await portfolioNetworkCall.fetchPortfolio(url: URL(string: "https://bit-group-one-back-end.azurewebsites.net/api/GroupInvestment/get-Portfolio-ByUserId/\(userID)")!)
            
            delegate?.didReceivedResponse(data: portfolioModel)
            print("The available groups are: \(portfolioModel)")
        } catch {
            delegate?.didReceiveError(error: "An error occurred during data retrieval: \(error.localizedDescription)")
        }
    }
}
