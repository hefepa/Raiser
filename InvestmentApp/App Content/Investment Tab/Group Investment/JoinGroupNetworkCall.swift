//
//  JoinGroupNetworkCall.swift
//  InvestmentApp
//
//  Created by WEMA on 19/02/2024.
//

import Foundation

struct JoinGroupNetworkCall{
    let session = URLSession.shared
    
    func fetchGroupInvestment(url: URL) async throws -> JoinGroupResponseModel? {
        
        do {
            let (data, _) = try await session.data(from: url)
            let jsonDecoder = JSONDecoder()
            let joinGroupModel = try jsonDecoder.decode(JoinGroupResponseModel.self, from: data)
            return joinGroupModel
        }catch{
            throw error
        }
    }
}

