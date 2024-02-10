//
//  ButtonColor.swift
//  InvestmentApp
//
//  Created by WEMA on 06/02/2024.
//

import Foundation
import QuartzCore
import UIKit

class ViewColor{
    func colorConfiguration(viewContainers: UIView){

        viewContainers.frame = CGRect(x: 0, y: 0, width: 200, height: 49)
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [
                UIColor(red: 0.804, green: 0.129, blue: 0.157, alpha: 1).cgColor,
                UIColor(red: 0.286, green: 0.047, blue: 0.235, alpha: 1).cgColor
            ]
            
            // Set the start and end points for the gradient
            gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
            
        viewContainers.layer.addSublayer(gradientLayer)
            
            // Set the frame of the gradient layer to match the view's bounds
        gradientLayer.frame = viewContainers.bounds
            
            // Add the gradient layer to the view's layer hierarchy
        viewContainers.layer.insertSublayer(gradientLayer, at: 0)
        viewContainers.layer.masksToBounds = true
            
        viewContainers.layer.cornerRadius = 3 // Adjust the corner radius as needed
        viewContainers.layer.borderWidth = 1.5 // Adjust the width as needed
        viewContainers.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0).cgColor // Light color on top
        viewContainers.layer.shadowColor = UIColor.darkGray.cgColor // Dark color on bottom
        viewContainers.layer.shadowOffset = CGSize(width: 0, height: 2) // Adjust as needed
        viewContainers.layer.shadowOpacity = 0.7
        viewContainers.layer.shadowRadius = 2
        }
    }

