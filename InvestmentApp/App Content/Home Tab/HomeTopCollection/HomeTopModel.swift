//
//  HomeTopModel.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import Foundation

struct HomeTopModel{
    func populateData() -> [HomeTopProperties] {
        [
            HomeTopProperties(collectionImages: "gettoknow"),
            HomeTopProperties(collectionImages: "gettoknow"),
            HomeTopProperties(collectionImages: "gettoknow"),
        ]
    }
}


struct HomeTopProperties{
    let collectionImages: String?
}
