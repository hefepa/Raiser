//
//  LoginViewModel.swift
//  InvestmentApp
//
//  Created by WEMA on 09/02/2024.
//

import Foundation

protocol LoginModelDelegate: AnyObject {
    func DidReceivedResponse(data: LoginResponseModel?)
    func DidReceiveError(error: String)
}
class LoginViewModel{
    
    weak var delegate: LoginModelDelegate?
    
    func login(emailInput: String, passwordInput: String) async {
       
        do {
            let dico: [String: Any] = ["email": emailInput, "password": passwordInput]
        
            let postURLString = "https://f062-155-93-95-78.ngrok-free.app/api/User/Login"
                    guard let postURL = URL(string: postURLString) else {
                        return
                    }
            let loginModel = try await LoginNetworkCall.shared.otpVerification(url: postURL, httpMethod: "POST", httpBodyPayload: dico)
            
            print("output is \(loginModel)")
            delegate?.DidReceivedResponse(data: loginModel)
            
        }catch(let error){
            print("not found")
            delegate?.DidReceiveError(error: "\(error.localizedDescription)")
        }
        
    }
}
