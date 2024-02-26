//
//  ROIViewModel.swift
//  InvestmentApp
//
//  Created by WEMA on 20/02/2024.
//

import Foundation

protocol ROIModelDelegate: AnyObject {
    func DidReceivedResponse(data: ROIResponseModel?)
    func DidReceiveError(error: String)
}
class ROIViewModel{
    
    weak var delegate: ROIModelDelegate?
    
    func purchaseInvestment(userDetails: Int, investmentId: Int, amountEntered: Double, days: Int, rate: Decimal, expectedReturns: Double) async {
       
        do {
            let dico: [String: Any] = ["userId": userDetails, "investmentInterestId": investmentId, "amount": amountEntered, "duration": days, "interestRate": rate, "roi": expectedReturns ]
            let postURLString = "https://bit-group-one-back-end.azurewebsites.net/api/GroupInvestment/calculateROI"
                    guard let postURL = URL(string: postURLString) else {
                        return
                    }
            let roiModel = try await ROINetworkCall.shared.calculateROI(url: postURL, httpMethod: "POST", httpBodyPayload: dico)
            
            print("output is a \(roiModel)")
            print("rate is:\(rate)")
            print("rate is:\(userDetails)")
            print("rate is:\(amountEntered)")
            print("rate is:\(expectedReturns)")
            print("rate is:\(days)")

            delegate?.DidReceivedResponse(data: roiModel)
            
        }catch(let error){
            print("not found")
            delegate?.DidReceiveError(error: "\(error.localizedDescription)")
        }
        
    }
}
