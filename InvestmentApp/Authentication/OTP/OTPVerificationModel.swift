//
//  OTPVerificationModel.swift
//  InvestmentApp
//
//  Created by WEMA on 08/02/2024.
//

import Foundation

class OTPVerificationModel: Codable{
    let otp: String?
}

class OTPResponseModel: Codable{
    let message: String?
    let success: Bool?
}
