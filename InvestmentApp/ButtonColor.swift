//
//  ButtonColor.swift
//  InvestmentApp
//
//  Created by WEMA on 06/02/2024.
//

import Foundation
import QuartzCore
import UIKit

class ButtonColor{
    func colorConfiguration(button: UIButton){
        
        
        button.frame = CGRect(x: 0, y: 0, width: 400, height: 49)
        let gradientLayer = CAGradientLayer()
               gradientLayer.colors = [
                UIColor(red: 0.804, green: 0.129, blue: 0.157, alpha: 1).cgColor,
                UIColor(red: 0.286, green: 0.047, blue: 0.235, alpha: 1).cgColor
               ]

        // Set the start and end points for the gradient
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
    
        button.layer.addSublayer(gradientLayer)
  
        // Set the frame of the gradient layer to match the view's bounds
        gradientLayer.frame = button.bounds

        // Add the gradient layer to the view's layer hierarchy
        button.layer.insertSublayer(gradientLayer, at: 0)
        button.layer.masksToBounds = true

        button.layer.cornerRadius = 8 // Adjust the corner radius as needed
        button.layer.borderWidth = 1.5 // Adjust the width as needed
        button.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0).cgColor // Light color on top
        button.layer.shadowColor = UIColor.darkGray.cgColor // Dark color on bottom
        button.layer.shadowOffset = CGSize(width: 0, height: 2) // Adjust as needed
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 20
    }
}
