//
//  TogglePassword.swift
//  InvestmentApp
//
//  Created by WEMA on 10/02/2024.
//

import Foundation
import UIKit

class PasswordVisibilityToggleUtility {
    
    static func togglePassword(in textFields: [UITextField], andUpdateImages imageViews: [UIImageView]) {
        // Toggle the secure text entry property of the password text fields
        for textField in textFields {
            textField.isSecureTextEntry.toggle()
        }
        
        // Update the eye images based on the current state of the password visibility
        for (index, textField) in textFields.enumerated() {
            updateEyeImageView(for: textField, andUpdateImage: imageViews[index])
        }
    }
    
    static func updateEyeImageView(for textField: UITextField, andUpdateImage imageView: UIImageView) {
        // Update the eye image based on the current state of the password visibility
        let imageState = textField.isSecureTextEntry ? "eye" : "openeye"
        imageView.image = UIImage(named: imageState)
    }
}


