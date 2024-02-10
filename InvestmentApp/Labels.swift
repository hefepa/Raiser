//
//  Labels.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

//import Foundation
//import QuartzCore
//import UIKit
//
//class LabelsColor{
//    func colorConfiguration(label: UILabel){
//        
//        
//        label.frame = CGRect(x: 0, y: 0, width: 370, height: 49)
//        let gradientLayer = CAGradientLayer()
//               gradientLayer.colors = [
//                UIColor(red: 0.804, green: 0.129, blue: 0.157, alpha: 1).cgColor,
//                UIColor(red: 0.286, green: 0.047, blue: 0.235, alpha: 1).cgColor
//               ]
//
//        // Set the start and end points for the gradient
//        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
//    
//        label.layer.addSublayer(gradientLayer)
//  
//        // Set the frame of the gradient layer to match the view's bounds
//        gradientLayer.frame = label.bounds
//
//        // Add the gradient layer to the view's layer hierarchy
//        label.layer.insertSublayer(gradientLayer, at: 0)
//        label.layer.masksToBounds = true
//
//        label.layer.cornerRadius = 8 // Adjust the corner radius as needed
//        label.layer.borderWidth = 1.5 // Adjust the width as needed
//        label.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0).cgColor // Light color on top
//        label.layer.shadowColor = UIColor.darkGray.cgColor // Dark color on bottom
//        label.layer.shadowOffset = CGSize(width: 0, height: 2) // Adjust as needed
//        label.layer.shadowOpacity = 0.7
//        label.layer.shadowRadius = 2
//    }
//}
//


import UIKit

class LabelsColor {
    func colorConfiguration(to label: UILabel, withText text: String) {
        // Create a gradient layer for the text
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.804, green: 0.129, blue: 0.157, alpha: 1).cgColor,
            UIColor(red: 0.286, green: 0.047, blue: 0.235, alpha: 1).cgColor
        ]

        // Set the start and end points for the gradient
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        // Set the frame of the gradient layer to match the label's bounds
        gradientLayer.frame = label.bounds

        // Create a gradient-colored text
        let attributedText = NSAttributedString(string: text, attributes: [
            .foregroundColor: UIColor.clear,
            .font: label.font ?? UIFont.systemFont(ofSize: 17)
        ])

        // Apply the gradient as the label's attributed text
        label.attributedText = attributedText

        // Add the gradient layer to the label's layer hierarchy
        label.layer.addSublayer(gradientLayer)

        // Set other properties as needed
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8 // Adjust the corner radius as needed
        label.layer.borderWidth = 1.5 // Adjust the width as needed
        label.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0).cgColor // Light color on top
        label.layer.shadowColor = UIColor.darkGray.cgColor // Dark color on bottom
        label.layer.shadowOffset = CGSize(width: 0, height: 2) // Adjust as needed
        label.layer.shadowOpacity = 0.7
        label.layer.shadowRadius = 2
    }
}
