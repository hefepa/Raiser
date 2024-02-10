//
//  OnboardingViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 05/02/2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var btn = ButtonColor()
    
    @IBOutlet weak var skipLabel: UILabel!
    @IBOutlet weak var getToKnowLabel: UILabel!
    @IBOutlet weak var getToKnowImage: UIImageView!
    @IBOutlet weak var subGetToKnowLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var buttonContainerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        propertiesAssignment()
        btn.colorConfiguration(button: continueButton)
        
        
        let skip = UITapGestureRecognizer(target: self, action: #selector(nextScreen))
        skipLabel.isUserInteractionEnabled = true
        skipLabel.addGestureRecognizer(skip)
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        let secondOnboarding = OnboardingSecondViewController()
        navigationController?.pushViewController(secondOnboarding, animated: true)
    }
    
    @objc func nextScreen(){
        let secondOnboarding = OnboardingSecondViewController()
        navigationController?.pushViewController(secondOnboarding, animated: true)
    }
    
    func propertiesAssignment(){
        
        skipLabel.text = "Skip"
        skipLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        getToKnowLabel.text = "Let's get to know you"
        getToKnowLabel.font = .systemFont(ofSize: 25, weight: .medium)
        
        subGetToKnowLabel.text = "Get a personalized investment experience that match your goals."
        subGetToKnowLabel.font = UIFont(name: "Lato", size: 16)
        subGetToKnowLabel.numberOfLines = 0
        subGetToKnowLabel.lineBreakMode = .byWordWrapping
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.tintColor = .white
        getToKnowImage.image = UIImage(named: "gettoknow")
    }
}
