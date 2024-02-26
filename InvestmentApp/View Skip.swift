//
//  View Skip.swift
//  InvestmentApp
//
//  Created by WEMA on 22/02/2024.
//

import Foundation

class AppUtility {
    
    static func isOnboardingSkipped() -> Bool {
        return UserDefaults.standard.bool(forKey: "IsOnboardingSkipped")
    }
    
    static func markOnboardingSkipped() {
        UserDefaults.standard.set(true, forKey: "IsOnboardingSkipped")
    }
}
