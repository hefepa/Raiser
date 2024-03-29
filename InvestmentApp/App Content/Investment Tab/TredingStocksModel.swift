//
//  TredingStocksModel.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import Foundation
//struct TrendingStockModel{
//    func populateData() -> [TrendingStockProperties]{
//        [
//            TrendingStockProperties(trendingImage: "wema", trendingName: "WEMABANK", subTrendingName: "Wema Bank Plc", stockStatus: "+0.15"),
//            TrendingStockProperties(trendingImage: "wema", trendingName: "WEMABANK", subTrendingName: "Wema Bank Plc", stockStatus: "+0.15"),
//            TrendingStockProperties(trendingImage: "wema", trendingName: "WEMABANK", subTrendingName: "Wema Bank Plc", stockStatus: "+0.15"),
//            TrendingStockProperties(trendingImage: "wema", trendingName: "WEMABANK", subTrendingName: "Wema Bank Plc", stockStatus: "-0.15"),
//            TrendingStockProperties(trendingImage: "wema", trendingName: "WEMABANK", subTrendingName: "Wema Bank Plc", stockStatus: "+0.15"),
//            TrendingStockProperties(trendingImage: "wema", trendingName: "WEMABANK", subTrendingName: "Wema Bank Plc", stockStatus: "+0.15"),
//            TrendingStockProperties(trendingImage: "wema", trendingName: "WEMABANK", subTrendingName: "Wema Bank Plc", stockStatus: "+0.15"),
//            TrendingStockProperties(trendingImage: "wema", trendingName: "WEMABANK", subTrendingName: "Wema Bank Plc", stockStatus: "-0.15"),
//        ]
//    }
//}
//
//
//struct TrendingStockProperties{
//    let trendingImage: String?
//    let trendingName: String?
//    let subTrendingName: String?
//    let stockStatus: String?
//}
//struct TrendingStockModel: Codable{
//    [TrendingStock]
//}
//struct TrendingModel:Codable{
//    [TrendingStockPropertiesModel
//}

struct TrendingStockPropertiesModel: Codable{
    
    let id: Int?
    let name: String?
    let priceStock: Double?
    let description: String?
    let url: String?
        
}
