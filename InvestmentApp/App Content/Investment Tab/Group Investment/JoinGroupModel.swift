//
//  JoinGroupModel.swift
//  InvestmentApp
//
//  Created by WEMA on 14/02/2024.
//

import Foundation


//struct JoinGroupModel{
//    func populateData() -> [JoinGroupProperties]{
//      [
//        JoinGroupProperties(img: "wema", name: "Temporal Quest", rate: "₦5,000,000 at 8%", progress: 0.90, percentageLeft: "10% remaining", days: "90 Days"),
//        JoinGroupProperties(img: "wema", name: "Temporal Quest", rate: "₦5,000,000 at 8%", progress: 0.75, percentageLeft: "25% remaining", days: "180 Days"),
//        JoinGroupProperties(img: "wema", name: "Temporal Quest", rate: "₦10,000,000 at 9%", progress: 0.50, percentageLeft: "50% remaining", days: "180 Days"),
//        JoinGroupProperties(img: "wema", name: "Investment Odyssey Squad", rate: "₦5,000,000 at 10%", progress: 0.50, percentageLeft: "50% remaining", days: "365 Days"),
//        JoinGroupProperties(img: "wema", name: "Time Vault Thrive", rate: "₦10,000,000 at 13%", progress: 0.20, percentageLeft: "10% remaining", days: "365 Days")
//        
//      ]
//    }
//}
//
//struct JoinGroupProperties{
//    let img: String?
//    let name: String?
//    let rate: String?
//    let progress: Float?
//    let percentageLeft: String?
//    let days: String?
//}
struct JoinGroupManualModel{
    func populateData() -> [JoinGroupManualProperties]{
        [
            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
            JoinGroupManualProperties(progress: 0.50, percentageLeft: "50% remaining"),
            JoinGroupManualProperties(progress: 0.75, percentageLeft: "25% remaining"),
            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining")
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining"),
//            JoinGroupManualProperties(progress: 0.90, percentageLeft: "10% remaining")

        ]
    }
}

struct JoinGroupManualProperties{
    let progress: Float?
    let percentageLeft: String?
}



struct JoinGroupResponseModel: Codable{
    let message: String?
    let success: Bool?
    var data: [JoinGroupProperties]?
    
}

struct JoinGroupProperties: Codable{
    let id: Int?
    let name: String?
    let maximumCapital: Int64?
    let url: String?
    let interestRate: Double?
    let duration: Int?
    let minimumCapital: Int64?
}
