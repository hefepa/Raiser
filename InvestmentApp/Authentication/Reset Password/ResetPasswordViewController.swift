//
//  ResetPasswordViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 05/02/2024.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var resetPasswordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var container: UIView!
    
    var btn = ButtonColor()
    var viewLabel = ViewColor()
    var lbl = LabelsColor()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardDismissRecognizer()

        btn.colorConfiguration(button: resetButton)
        viewLabel.colorConfiguration(viewContainers: container)
        
        resetPasswordLabel.text = "Reset your password"
        //lbl.colorConfiguration(to: resetPasswordLabel, withText: resetPasswordLabel.text!)
        resetPasswordLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        
        
        
        emailLabel.text = "Email"
        emailLabel.textColor = .white
        emailLabel.font = .systemFont(ofSize: 16)
        emailTF.placeholder = "Enter your email address"
        
        
        resetButton.setTitle("Reset Password", for: .normal)
        resetButton.backgroundColor = .gray
        resetButton.tintColor = .white
        resetButton.layer.cornerRadius = 8

    }
}

