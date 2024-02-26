//
//  TrendingStockNetworkCall.swift
//  InvestmentApp
//
//  Created by WEMA on 18/02/2024.
//

import Foundation

struct TrendingStockNetworkCall{
    let session = URLSession.shared
    
    func fetchTrendngStock(url: URL) async throws -> [TrendingStockPropertiesModel]? {
        
        do {
            let (data, _) = try await session.data(from: url)
            let jsonDecoder = JSONDecoder()
            let trendingStockModel = try jsonDecoder.decode([TrendingStockPropertiesModel].self, from: data)
            return trendingStockModel
        }catch{
            throw error
        }
    }
}
