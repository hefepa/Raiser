//
//  Splash Model.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import Foundation

struct SplashSreenModel{
    func populateData() -> [SplashSreenProperties]{
        [
            SplashSreenProperties(subRaiser: "Start Your Wealth Journey Today, Watch Your Money Grow!", raiserPicture: "splash1"),
            SplashSreenProperties(subRaiser: "Invest Smarter, Not Harder with Personalized Investment, Tailored for You", raiserPicture: "splash2")
        ]
        
    }
}


struct SplashSreenProperties{
    let subRaiser: String?
    let raiserPicture: String?
}
