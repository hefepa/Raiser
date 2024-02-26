//
//  ROIModel.swift
//  InvestmentApp
//
//  Created by WEMA on 20/02/2024.
//

import Foundation

struct ROIPropetiesModel: Codable{
    let userId: Int?
    let investmentInterestId: Int
    let amount: Double?
    let duration: Int?
    let interestRate: Double?
    let roi: Double?
}

struct ROIResponseModel: Codable{
    let message: String?
    let success: Bool?
}
