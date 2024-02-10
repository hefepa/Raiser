//
//  registrationModel.swift
//  InvestmentApp
//
//  Created by WEMA on 08/02/2024.
//

import Foundation

class RegistrationModel: Codable {
    
    let firstName: String?
    let lastName: String?
    let email: String?
    let phoneNumber: String?
    let password: String?
    let confirmPassword: String?
}

class RegistrationResponseModel: Codable{
    let message: String?
    let success: Bool?
}
