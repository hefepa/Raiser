//
//  LearnModel.swift
//  InvestmentApp
//
//  Created by WEMA on 06/02/2024.
//

import Foundation

struct LearnPropertiesModel{
    func populateData() -> [LearnProperties]{
        [
            LearnProperties(images: "study", heading: "Study", subHeading: "Explore for a Smarter, More Confident Approach to Money Matters."),
            LearnProperties(images: "quiz", heading: "Quiz", subHeading: "Fun and interactive way to Test and Enhance Your Financial Literacy."),
            LearnProperties(images: "games", heading: "Games", subHeading: "Engage for a Playful and Educational Experience.")
        ]
       
    }
}


struct LearnProperties{
    let images: String?
    let heading: String?
    let subHeading: String?
}
