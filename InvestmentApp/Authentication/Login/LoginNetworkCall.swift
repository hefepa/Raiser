//
//  LoginNetworkCall.swift
//  InvestmentApp
//
//  Created by WEMA on 09/02/2024.
//

import Foundation

struct LoginNetworkCall{
    let session = URLSession.shared
    static let shared = LoginNetworkCall()
    func otpVerification(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> LoginResponseModel? {
        
        do{
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            if httpBodyPayload != nil {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: httpBodyPayload as Any, options: [])
            }
            urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            
            
            let (data, _) = try await session.data(for: urlRequest)
            
            let jsonDecoder = JSONDecoder()
            let loginResponseModel = try jsonDecoder.decode(LoginResponseModel.self, from: data)
            print("The result is \(loginResponseModel)")
            return loginResponseModel
            
        }catch{
            throw error
        }
    }
}
