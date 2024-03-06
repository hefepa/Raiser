//
//  ResetPasswordViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 05/02/2024.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var resetPasswordLabel: UILabel!
    @IBOutlet weak var subResetPasswordLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    
    var btn = ButtonColor()
    var viewLabel = ViewColor()
    var lbl = LabelsColor()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardDismissRecognizer()
        
        resetPasswordLabel.text = "Reset your password"
        //lbl.colorConfiguration(to: resetPasswordLabel, withText: resetPasswordLabel.text!)
        resetPasswordLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        resetPasswordLabel.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        
        subResetPasswordLabel.text = "Enter your email address to reset your password"
        subResetPasswordLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        emailTF.placeholder = "Enter your email address"
        
        
        resetButton.setTitle("Reset Password", for: .normal)
        resetButton.tintColor = .white
        resetButton.layer.cornerRadius = 8
        resetButton.backgroundColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)


    }
}

