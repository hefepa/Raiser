//
//  OnboardingFiveViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 06/02/2024.
//

import UIKit

class OnboardingFiveViewController: UIViewController {
    
    var btn = ButtonColor()

    
    @IBOutlet weak var skipLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var subIncomeLabel: UILabel!
    @IBOutlet weak var lessFifty: UILabel!
    @IBOutlet weak var fiftyPlus: UILabel!
    @IBOutlet weak var hundredPlus: UILabel!
    @IBOutlet weak var twoHundredPlus: UILabel!
    @IBOutlet weak var fiveHundredPlus: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet var containers: [UIView]!
    
    @IBOutlet var checkBoxesArray: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        btn.colorConfiguration(button: nextButton)
        
        for checkboxes in checkBoxesArray{
            checkboxes.layer.cornerRadius = checkboxes.frame.height / 2
            
            checkboxes.setImage(UIImage(systemName: "circle")?.withRenderingMode(.alwaysTemplate), for: .normal)
            checkboxes.setImage(UIImage(named: "circletick")?.withRenderingMode(.alwaysOriginal), for: .selected)
        }
        
        propertiesAssignment()
        /*updateNextButtonState*/()
        let skip = UITapGestureRecognizer(target: self, action: #selector(nextScreen))
        skipLabel.isUserInteractionEnabled = true
        skipLabel.addGestureRecognizer(skip)
    }
    
//    func updateNextButtonState() {
//        let isAnyCheckBoxSelected = checkBoxesArray.contains { $0.isSelected }
//        nextButton.isEnabled = isAnyCheckBoxSelected
//        nextButton.alpha = isAnyCheckBoxSelected ? 1.0 : 0.5
//        }
    
    func isOnboardingSkipped(forUserWithEmail userEmail: String) -> Bool {
            return UserDefaults.standard.bool(forKey: "IsOnboardingSkipped")
        }
    
    // Function to mark that the onboarding process was skipped
    func markOnboardingSkipped() {
            AppUtility.markOnboardingSkipped()
        }
    
    
    @IBAction func nextBtn(_ sender: UIButton){
        if checkBoxesArray.contains(where: { $0.isSelected }) {
            markOnboardingSkipped()
            let home = TabViewController()
            navigationController?.pushViewController(home, animated: true)
        }
    }
    

    @objc func nextScreen(){
        let home = TabViewController()
        navigationController?.pushViewController(home, animated: true)
    }

    func propertiesAssignment(){
        skipLabel.text = "Skip"
        skipLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        incomeLabel.text = "Income"
        incomeLabel.font = .systemFont(ofSize: 25, weight: .medium)
        
        subIncomeLabel.text = "Please select your monthly income range from the options below."
        subIncomeLabel.font = UIFont(name: "Lato", size: 16)
        subIncomeLabel.numberOfLines = 0
        subIncomeLabel.lineBreakMode = .byWordWrapping
        
        lessFifty.text = "less than #50,000"
        fiftyPlus.text = "#50,000 - #99,999"
        hundredPlus.text = "#100,000 - #199,999"
        twoHundredPlus.text = "#200,000 - #499,999"
        fiveHundredPlus.text = "#500,000 and above"
        
        nextButton.setTitle("Complete", for: .normal)
        nextButton.tintColor = .white
        
        for labelContainers in containers{
            labelContainers.layer.shadowColor = UIColor.black.cgColor
            labelContainers.layer.shadowOpacity = 0.2
            labelContainers.layer.shadowOffset = CGSize(width: 0, height: 2)
            labelContainers.layer.shadowRadius = 4
        }
    }
 
    @IBAction func lessFiftyCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
//        updateNextButtonState()
    }
    
    @IBAction func fiftyPlusCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
//        updateNextButtonState()
    }
    
    @IBAction func hundredPlusCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
//        updateNextButtonState()
    }
    
    @IBAction func twoHundredPlusCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
//        updateNextButtonState()
    }
    
    @IBAction func fiveHundredPlusCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
//        updateNextButtonState()
    }


}
