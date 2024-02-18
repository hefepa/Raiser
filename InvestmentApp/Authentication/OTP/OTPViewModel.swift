//
//  OTPViewModel.swift
//  InvestmentApp
//
//  Created by WEMA on 08/02/2024.
//

import Foundation

protocol OTPModelDelegate: AnyObject {
    func DidReceivedResponse(data: OTPResponseModel?)
    func DidReceiveError(error: String)
}
class OTPViewModel{
    
    weak var delegate: OTPModelDelegate?
    
    func verifyOTP(otps: String) async {
       
        do {
            let dico: [String: Any] = ["otp": otps]
//        https://bit-group-one-back-end.azurewebsites.net/api/User/validate
            let postURLString = "https://bit-group-one-back-end.azurewebsites.net/api/User/validate"
                    guard let postURL = URL(string: postURLString) else {
                        return
                    }
            let otpModel = try await OTPNetworkCall.shared.otpVerification(url: postURL, httpMethod: "POST", httpBodyPayload: dico)
            
            print("output is \(otpModel)")
            delegate?.DidReceivedResponse(data: otpModel)
            
        }catch(let error){
            print("not found")
            delegate?.DidReceiveError(error: "\(error.localizedDescription)")
        }
        
    }
}
