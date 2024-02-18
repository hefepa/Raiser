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
            CategoriesProperties(catImage: "groupinvest", catName: "Group Investment"),
            CategoriesProperties(catImage: "catstock", catName: "Nigeria Stocks"),
            CategoriesProperties(catImage: "catagro", catName: "Agro"),
//            CategoriesProperties(catImage: "cathouse", catName: "Real Estate"),
        ]
    }
}

struct CategoriesProperties{
    let catImage: String?
    let catName: String?
}
