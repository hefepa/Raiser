//
//  JoinGroupViewModel.swift
//  InvestmentApp
//
//  Created by WEMA on 19/02/2024.
//

import Foundation

protocol JoinGroupModelDelegate: AnyObject {
    func didReceivedResponse(data: JoinGroupResponseModel?)
    func didReceiveError(error: String)
}

class JoinGroupViewModel {
    var joinGroupNetworkCall: JoinGroupNetworkCall
    
    init(joinGroupNetworkCall: JoinGroupNetworkCall) {
        self.joinGroupNetworkCall = joinGroupNetworkCall
    }
    
    weak var delegate: JoinGroupModelDelegate?
    
    func getAvailableGroup() async {
        do {
            let joinGroupModel = try await joinGroupNetworkCall.fetchGroupInvestment(url: URL(string: "https://bit-group-one-back-end.azurewebsites.net/api/GroupInvestment/Group-Investments")!)
            
            delegate?.didReceivedResponse(data: joinGroupModel)
            print("The available groups are: \(joinGroupModel)")
        } catch {
            delegate?.didReceiveError(error: "An error occurred during data retrieval: \(error.localizedDescription)")
        }
    }
}
