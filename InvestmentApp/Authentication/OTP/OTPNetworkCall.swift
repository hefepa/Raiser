//
//  OTPNetworkCall.swift
//  InvestmentApp
//
//  Created by WEMA on 08/02/2024.
//

import Foundation

struct OTPNetworkCall{
    let session = URLSession.shared
    static let shared = OTPNetworkCall()
    func otpVerification(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> OTPResponseModel? {
        
        do{
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            if httpBodyPayload != nil {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: httpBodyPayload as Any, options: [])
            }
            urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            
            
            let (data, _) = try await session.data(for: urlRequest)
            
            let jsonDecoder = JSONDecoder()
            let otpResponseModel = try jsonDecoder.decode(OTPResponseModel.self, from: data)
            print("The result is \(otpResponseModel)")
            return otpResponseModel
            
        }catch{
            throw error
        }
    }
}
