//
//  AgroModel.swift
//  InvestmentApp
//
//  Created by WEMA on 09/02/2024.
//

import Foundation

struct CategoriesPropertiesModel{
    func populateData() -> [CategoriesProperties]{
        [
            CategoriesProperties(catImage: "catagro", catName: "Agro"),
            CategoriesProperties(catImage: "cathouse", catName: "Real Estate"),
            CategoriesProperties(catImage: "catstock", catName: "Nigeria Stocks")
        ]
    }
}

struct CategoriesProperties{
    let catImage: String?
    let catName: String?
}
