//
//  VerificationUpdatesModel.swift
//  InvestmentApp
//
//  Created by WEMA on 08/02/2024.
//

import Foundation

struct VerificationUpdatesModel{
    func populateData() -> [VerificationUpdatesProperties]{
        [
            VerificationUpdatesProperties(verificationImage: "bvn", verificationAction: "Add your BVN"),
            VerificationUpdatesProperties(verificationImage: "profile", verificationAction: "Update your Profile Picture"),
            VerificationUpdatesProperties(verificationImage: "fingerprint", verificationAction: "Enable Fingerprint/Face ID")
        ]
    }

}


struct VerificationUpdatesProperties{
    let verificationImage: String?
    let verificationAction: String?
    
}
