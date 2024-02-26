//
//  LoginModel.swift
//  InvestmentApp
//
//  Created by WEMA on 09/02/2024.
//

import Foundation

class LoginResponseModel: Codable{
    let userId: Int?
    let token: String?
    let message: String?
    let success: Bool?
    let userDetails: LoginUserDetailsModel?
    
}

class LoginUserDetailsModel: Codable{
    let firstName: String?
    let lastName: String?
    let email: String?
    let phoneNumber: String?
}
