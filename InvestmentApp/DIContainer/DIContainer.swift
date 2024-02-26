//
//  DIContainer.swift
//  InvestmentApp
//
//  Created by WEMA on 18/02/2024.
//

import Foundation

class DIContainer {
    
    static let shared: DIContainer = DIContainer()
    
    private init() {}
    
    func makeTrendingStock() -> TrendingStockViewModel{
        TrendingStockViewModel(trendingStocknetworkCall: TrendingStockNetworkCall())
    }
    
//    func makeBooksViewModel() -> BooksViewModel{
//        BooksViewModel(networkCall: NetworkCall())
//    }
}
