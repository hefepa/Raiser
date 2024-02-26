//
//  LabelColor.swift
//  InvestmentApp
//
//  Created by WEMA on 18/02/2024.
//

import Foundation
import CoreGraphics
import UIKit

protocol GradientImageProvider {
    func gradientImage(frame: CGRect, colors: [CGColor]) -> UIImage?
}

extension GradientImageProvider {
    func gradientImage(frame: CGRect, colors: [CGColor]) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = colors

        // Create an image using UIGraphicsImageRenderer
        let renderer = UIGraphicsImageRenderer(size: frame.size)
        let image = renderer.image { _ in
            gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        }
        return image
    }
}

extension UIView: GradientImageProvider {}
