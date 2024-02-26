//
//  CustomAlertViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 15/02/2024.
//

import UIKit

class CustomAlertViewController: UIViewController {
    
    
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var subSuccessLabel: UILabel!
    @IBOutlet weak var checkMarkImage: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var viewPortfolio: UILabel!
    
    var okAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6) // Semi-transparent black background
        containerView.backgroundColor = UIColor.white
        containerView.layer.masksToBounds = true
        checkMarkImage.contentMode = .scaleAspectFit
        
        
        successLabel.text = "Success!"
        successLabel.font = .systemFont(ofSize: 30, weight: .medium)
        subSuccessLabel.text = "Congratulations, your Investment has been successfully created."
        subSuccessLabel.font = .systemFont(ofSize: 14, weight: .light)
        checkMarkImage.image = UIImage(named: "checkmark")
        viewPortfolio.text = "View Portfolio"
        viewPortfolio.font = .systemFont(ofSize: 13, weight: .regular)
        viewPortfolio.textColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.tintColor = .white
        btn.colorConfiguration(button: continueButton)
        
        
        continueButton.addTarget(self, action: #selector(continueBtnTapped), for: .touchUpInside)
    }
    
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        dismiss(animated: true){
            self.okAction?()
        }
    }
}

