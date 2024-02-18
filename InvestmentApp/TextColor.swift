//
//  TextColor.swift
//  InvestmentApp
//
//  Created by WEMA on 10/02/2024.
//

import Foundation
import UIKit
//class TextColor{
//    func textFontColor(label: UILabel){
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = label.bounds // Set the frame to match the label's bounds
//        gradientLayer.colors = [
//            UIColor(red: 0.804, green: 0.129, blue: 0.157, alpha: 1).cgColor,
//            UIColor(red: 0.286, green: 0.047, blue: 0.235, alpha: 1).cgColor
//        ]
//
//        // Apply the gradient layer as the background of the label
//        label.layer.insertSublayer(gradientLayer, at: 0)
//
//        // Set the text color of the label to clear
//        label.textColor = .clear
//    }
//}



import UIKit    
    class ImageUtility {
        static func gradientImage(frame: CGRect, colors: [UIColor]) -> UIImage? {
            let cgColors = colors.map { $0.cgColor }

            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = frame
            gradientLayer.colors = cgColors

            // Create an image using UIGraphicsImageRenderer
            let renderer = UIGraphicsImageRenderer(bounds: frame)
            let image = renderer.image { _ in
                gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
            }
            return image
        }
    }

