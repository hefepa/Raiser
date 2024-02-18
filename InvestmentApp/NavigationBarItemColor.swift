//
//  NavigationBarItemColor.swift
//  InvestmentApp
//
//  Created by WEMA on 17/02/2024.
//

import Foundation
import UIKit
import CoreImage

extension UIImage {
    var dominantColor: UIColor? {
        guard let ciImage = CIImage(image: self) else { return nil }
        
        let colorCubeFilter = CIFilter(name: "CIColorCube")!
        colorCubeFilter.setValue(ciImage, forKey: kCIInputImageKey)
        colorCubeFilter.setValue(8, forKey: "inputCubeDimension")
        
        guard let outputImage = colorCubeFilter.outputImage else { return nil }
        let context = CIContext(options: nil)
        let cgImage = context.createCGImage(outputImage, from: outputImage.extent)
        let uiImage = UIImage(cgImage: cgImage!)
        
        return uiImage.averageColor
    }

    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)
        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: nil)
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
        
        return UIColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
    }
}

//// Usage
//if let image = profileImageView.image,
//   let dominantColor = image.dominantColor {
//    navigationItem.leftBarButtonItem?.tintColor = dominantColor
//}
//
//// Set up your left bar button item
//navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu2"), style: .plain, target: self, action: nil)
