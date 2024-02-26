//
//  PortFolioModel.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import Foundation

//struct PortFolioModel{
//    func populateData() -> [PortFolioProperties]{
//        [
//            PortFolioProperties(investmentPortfolio: "Your Investment portfolio is empty now", clickHere: "Click here to get started")
//        ]
//    }
//}

//struct PortFolioProperties{
//    let investmentPortfolio: String?
//    let clickHere: String?
////    let toGetStarted: String?
//}
struct PortFolioResponseModel: Codable{
    let message: String?
    let success: Bool?
    let data: [PortFolioProperties]?
}


struct PortFolioProperties: Codable{
    let id: Int?
    let interestRate: Decimal?
    let investmentName: String?
    let invesmentInterestId: Int?
    let amount: Decimal?
    let duration: Int?
    let roi: Decimal?
    let referenceNumber: String?
    let createdAt: String?
    let endDate: String?
    let status: String?
    let amountInWords: String?
    let investmentType: String?
}
