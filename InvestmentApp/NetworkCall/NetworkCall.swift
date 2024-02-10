//
//  NetworkCall.swift
//  InvestmentApp
//
//  Created by WEMA on 08/02/2024.
//

import Foundation

struct NetworkCall{
    let session = URLSession.shared
    static let shared = NetworkCall()
    func register(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> RegistrationResponseModel? {
        
        do{
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            if httpBodyPayload != nil {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: httpBodyPayload as Any, options: [])
            }
            urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            
            
            let (data, _) = try await session.data(for: urlRequest)
            
            let jsonDecoder = JSONDecoder()
            let registrationResponseModel = try jsonDecoder.decode(RegistrationResponseModel.self, from: data)
            print("The result is \(registrationResponseModel)")
            return registrationResponseModel
            
        }catch{
            throw error
        }
    }
}
