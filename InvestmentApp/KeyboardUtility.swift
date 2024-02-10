//
//  KeyboardUtility.swift
//  InvestmentApp
//
//  Created by WEMA on 09/02/2024.
//

import Foundation
import UIKit


extension UIViewController {
    func setupKeyboardDismissRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
