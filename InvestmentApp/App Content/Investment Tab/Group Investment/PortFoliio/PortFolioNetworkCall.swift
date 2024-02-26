//
//  PortFolioNetworkCall.swift
//  InvestmentApp
//
//  Created by WEMA on 21/02/2024.
//

import Foundation

struct PortFolioNetworkCall{
    let session = URLSession.shared
    
    func fetchPortfolio(url: URL) async throws -> PortFolioResponseModel? {
        
        do {
            let (data, _) = try await session.data(from: url)
            let jsonDecoder = JSONDecoder()
            let portfolioModel = try jsonDecoder.decode(PortFolioResponseModel.self, from: data)
            return portfolioModel
        }catch{
            throw error
        }
    }
}

