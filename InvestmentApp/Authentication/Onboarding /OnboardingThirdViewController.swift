//
//  OnboardingThirdViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 05/02/2024.
//

import UIKit

class OnboardingThirdViewController: UIViewController {
    
    var btn = ButtonColor()
   
    @IBOutlet weak var skipLabel: UILabel!
    @IBOutlet weak var subInterestLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var agroLabel: UILabel!
    @IBOutlet weak var realEstateLabel: UILabel!
    @IBOutlet weak var stocksLabel: UILabel!
    @IBOutlet weak var dollarLabel: UILabel!
    @IBOutlet weak var mutualFundsLabel: UILabel!
    @IBOutlet weak var noIdeaLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet var containers: [UIView]!
    @IBOutlet var checkBoxesArray: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        btn.colorConfiguration(button: nextButton)
        
        for buttons in checkBoxesArray{
            buttons.setImage(UIImage(systemName: "square")?.withRenderingMode(.alwaysTemplate), for: .normal)
            buttons.setImage(UIImage(named: "tick")?.withRenderingMode(.alwaysOriginal), for: .selected)
        }
        propertiesAssignment()
        
        let skip = UITapGestureRecognizer(target: self, action: #selector(nextScreen))
        skipLabel.isUserInteractionEnabled = true
        skipLabel.addGestureRecognizer(skip)
    }
    
   
    
    // Function to mark that the onboarding process was skipped
    func markOnboardingSkipped() {
            AppUtility.markOnboardingSkipped()
        }
   
    
    @IBAction func nextBtn(_ sender: UIButton){
        if checkBoxesArray.contains(where: { $0.isSelected }) {
            markOnboardingSkipped()
            let fourth = OnboardingFourViewController()
            navigationController?.pushViewController(fourth, animated: true)
        }
    }
    
    @objc func nextScreen(){
        let fourth = OnboardingFourViewController()
        navigationController?.pushViewController(fourth, animated: true)
    }
 
    func propertiesAssignment(){
        skipLabel.text = "Skip"
        skipLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        interestLabel.text = "Interest"
        interestLabel.font = .systemFont(ofSize: 25, weight: .medium)
        
        subInterestLabel.text = "What kind of investment are you interested in?"
        subInterestLabel.font = UIFont(name: "Lato", size: 16)
        subInterestLabel.numberOfLines = 0
        subInterestLabel.lineBreakMode = .byWordWrapping
        
        agroLabel.text = "Agro"
        realEstateLabel.text = "Real Estate"
        stocksLabel.text = "Stocks"
        dollarLabel.text = "Dollar"
        mutualFundsLabel.text = "Mutual funds"
        noIdeaLabel.text = "No idea"
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.tintColor = .white
        
        for labelContainers in containers{
            labelContainers.layer.shadowColor = UIColor.black.cgColor
            labelContainers.layer.shadowOpacity = 0.2
            labelContainers.layer.shadowOffset = CGSize(width: 0, height: 2)
            labelContainers.layer.shadowRadius = 4
        }
    }
    
    
    @IBAction func agroCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func realEstateCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func stocksCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func dollarCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func mutualFundsCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func noIdeaCheckBox(_ sender: UIButton) {
        
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = !sender.isSelected
    }
}
