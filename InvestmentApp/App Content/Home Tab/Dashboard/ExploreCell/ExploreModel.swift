//
//  ExploreModel.swift
//  InvestmentApp
//
//  Created by WEMA on 26/02/2024.
//

import Foundation

struct ExploreModel{
    func populateData() -> [ExploreProperties]{
        [
            ExploreProperties(exploreImage: "study 1", exploreName: "Study"),
            ExploreProperties(exploreImage: "games 1", exploreName: "Games"),
            ExploreProperties(exploreImage: "quiz 1", exploreName: "Quiz"),
            ExploreProperties(exploreImage: "portfolio", exploreName: "Portfolio"),
            ExploreProperties(exploreImage: "stocks", exploreName: "Stocks"),
            ExploreProperties(exploreImage: "advisor", exploreName: "Financial Advisor"),
            ExploreProperties(exploreImage: "glossary", exploreName: "Invesment Glossary"),
            ExploreProperties(exploreImage: "news", exploreName: "News"),
            ExploreProperties(exploreImage: "community", exploreName: "Raisers Community"),
        ]
    }
}

struct ExploreProperties{
    let exploreImage: String?
    let exploreName: String?
}
