//
//  StartLearningModel.swift
//  InvestmentApp
//
//  Created by WEMA on 02/03/2024.
//

import Foundation

struct StartLearningModel{
    func populateData() -> [StartLearningProperties] {
        [
            StartLearningProperties(startLearningImage: "raiservideo1", startLearningTitle: "Investment Basics", subStartLearningTitle: "Investment Basics covers the fundamentals of Risk and Return, as well as the essential concept of Time Value...", percentageCompleted: "0% Completed", progressBar: 0.0),
            StartLearningProperties(startLearningImage: "raiservideo1", startLearningTitle: "Investment vs Savings", subStartLearningTitle: "Welcome to our course on Differentiating savings and investment, where we delve into understanding the...", percentageCompleted: "0% Completed", progressBar: 0.0),
            StartLearningProperties(startLearningImage: "raiservideo1", startLearningTitle: "Personal Finance", subStartLearningTitle: "Introducing the Basics of Budgeting, where we will cover essentials of financial management principles,...", percentageCompleted: "0% Completed", progressBar: 0.0),
            StartLearningProperties(startLearningImage: "raiservideo1", startLearningTitle: "Personal Finance", subStartLearningTitle: "Introducing the Basics of Budgeting, where we will cover essentials of financial management principles,...", percentageCompleted: "0% Completed", progressBar: 0.0)
        ]
    }
}

struct StartLearningProperties{
    let startLearningImage: String?
    let startLearningTitle: String?
    let subStartLearningTitle: String?
    let percentageCompleted: String?
    let progressBar: Float?
}
