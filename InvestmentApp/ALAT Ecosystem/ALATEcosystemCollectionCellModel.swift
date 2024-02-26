//
//  ALATEcosystemCollectionCellModel.swift
//  InvestmentApp
//
//  Created by WEMA on 25/02/2024.
//

import Foundation

struct DataLoader {
    static func loadData() -> [ALATEcosystemCollectionCellProperties] {
        ALATEcosystemCollectionCellModel().populateData()
    }
}

struct ALATEcosystemCollectionCellModel{
    func populateData() -> [ALATEcosystemCollectionCellProperties]{
        [
            ALATEcosystemCollectionCellProperties(firstText: "Work or Play", secondText: "Go all out with ALAT", collectionImage: "workandplay"),
            ALATEcosystemCollectionCellProperties(firstText: "Work or Play", secondText: "Go all out with ALAT", collectionImage: "workandplay"),
            ALATEcosystemCollectionCellProperties(firstText: "Work or Play", secondText: "Go all out with ALAT", collectionImage: "workandplay")
        ]
    }
}

struct ALATEcosystemCollectionCellProperties{
    let firstText: String?
    let secondText: String?
    let collectionImage: String?
}
