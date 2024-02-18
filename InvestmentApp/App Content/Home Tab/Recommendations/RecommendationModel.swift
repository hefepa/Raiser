//
//  RecommendationModel.swift
//  InvestmentApp
//
//  Created by WEMA on 16/02/2024.
//

import Foundation

struct RecommendationModel{
    func populateData() -> [RecommendationProperties]{
        [
            RecommendationProperties(image: "agric", recommendationName: "Agriculture", investNow: "Invest Now"),
            RecommendationProperties(image: "estate", recommendationName: "Real Estate", investNow: "Invest Now")
        ]
    }
}

struct RecommendationProperties{
    let image: String?
    let recommendationName: String?
    let investNow: String?
}
