//
//  ROINetworkCall.swift
//  InvestmentApp
//
//  Created by WEMA on 20/02/2024.
//

import Foundation

struct ROINetworkCall{
    let session = URLSession.shared
    static let shared = ROINetworkCall()
    func calculateROI(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> ROIResponseModel? {
        
        do{
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            if httpBodyPayload != nil {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: httpBodyPayload as Any, options: [])
            }
            urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            
            
            let (data, _) = try await session.data(for: urlRequest)
            
            let jsonDecoder = JSONDecoder()
            let roiResponseModel = try jsonDecoder.decode(ROIResponseModel.self, from: data)
            print("The result is \(roiResponseModel)")
            return roiResponseModel
            
        }catch{
            throw error
        }
    }
}
