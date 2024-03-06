//
//  UserDefaultsExtension.swift
//  InvestmentApp
//
//  Created by WEMA on 03/03/2024.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String{
        case hasViewedSplashScreen
    }
    
    var hasViewSplashScreen: Bool{
        get{
            bool(forKey: UserDefaultsKeys.hasViewedSplashScreen.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasViewedSplashScreen.rawValue)
        }
    }
}
