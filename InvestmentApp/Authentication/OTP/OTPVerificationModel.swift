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
    let code: String?
    let success: Bool?
    let data: OTPDetailsModel?
}

class OTPDetailsModel: Codable{
    let firstName: String?
    let lastName: String?
    let email: String?
    let phoneNumber: String?
}
