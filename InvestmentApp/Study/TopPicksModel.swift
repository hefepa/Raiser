//
//  TopPicksModel.swift
//  InvestmentApp
//
//  Created by WEMA on 02/03/2024.
//

import Foundation

struct TopPicksModel{
    func populateData() -> [TopPicksProperties]{
        [
            TopPicksProperties(imagePicks: "raiservideo1", labelPicks: "Advancement Investment Strategies"),
            TopPicksProperties(imagePicks: "raiservideo1", labelPicks: "Entrepreneurial Finance"),
        ]
    }
}



struct TopPicksProperties{
    let imagePicks: String?
    let labelPicks: String?
}
