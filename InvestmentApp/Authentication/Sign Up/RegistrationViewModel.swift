//
//  RegistrationViewModel.swift
//  InvestmentApp
//
//  Created by WEMA on 08/02/2024.
//

import Foundation

protocol RegistrationModelDelegate: AnyObject {
    func DidReceivedResponse(data: RegistrationResponseModel?)
    func DidReceiveError(error: String)
}
class RegistrationViewModel{
    
    weak var delegate: RegistrationModelDelegate?
    
    func registerUser(firstNameInput: String, lastNameInput: String, emailInput: String, phoneNumberInput: String, passwordInput: String, confirmPasswordInput: String) async {
       
        do {
            let dico: [String: Any] = ["firstName": firstNameInput, "lastName": lastNameInput, "email": emailInput, "phoneNumber": phoneNumberInput, "password": passwordInput, "confirmPassword": confirmPasswordInput]
            let postURLString = "https://bit-group-one-back-end.azurewebsites.net/api/User/register"
                    guard let postURL = URL(string: postURLString) else {
                        return
                    }
            let registerModel = try await NetworkCall.shared.register(url: postURL, httpMethod: "POST", httpBodyPayload: dico)
            
            print("output is \(registerModel)")
            delegate?.DidReceivedResponse(data: registerModel)
            
        }catch(let error){
            print("not found")
            delegate?.DidReceiveError(error: "\(error.localizedDescription)")
        }
        
    }
}
    
