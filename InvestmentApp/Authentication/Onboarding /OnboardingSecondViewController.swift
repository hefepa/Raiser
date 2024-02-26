//
//  OnboardingSecondViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 05/02/2024.
//

import UIKit

class OnboardingSecondViewController: UIViewController {
    
    var btn = ButtonColor()
    
    @IBOutlet weak var subExperienceLabel: UILabel!
    @IBOutlet weak var skipLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var beginnerLabelCheckBox: UILabel!
    @IBOutlet weak var amateurLabelCheckBox: UILabel!
    @IBOutlet weak var intermediateLabelCheckBox: UILabel!
    @IBOutlet weak var expertLabelCheckBox: UILabel!
    @IBOutlet var checkBoxesArray: [UIButton]!
    @IBOutlet var containers: [UIView]!
    @IBOutlet var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        btn.colorConfiguration(button: nextButton)
        
        for buttons in checkBoxesArray{
            buttons.layer.cornerRadius = buttons.frame.height / 2
            
            buttons.setImage(UIImage(systemName: "circle")?.withRenderingMode(.alwaysTemplate), for: .normal)
            buttons.setImage(UIImage(named: "circletick")?.withRenderingMode(.alwaysOriginal), for: .selected)
            
        }
        propertiesAssignment()
        let skip = UITapGestureRecognizer(target: self, action: #selector(nextScreen))
        skipLabel.isUserInteractionEnabled = true
        skipLabel.addGestureRecognizer(skip)
    }
//    let storedEmail = UserDefaults.standard.string(forKey: "UserEmail")
    func isOnboardingSkipped(forUserWithEmail userEmail: String) -> Bool {
            return UserDefaults.standard.bool(forKey: "IsOnboardingSkipped")
        }
    
    // Function to mark that the onboarding process was skipped
    func markOnboardingSkipped() {
            AppUtility.markOnboardingSkipped()
        }
    
    @IBAction func continueBtn(_ sender: UIButton){
        if checkBoxesArray.contains(where: { $0.isSelected }) {
            markOnboardingSkipped()
            let third = OnboardingThirdViewController()
            navigationController?.pushViewController(third, animated: true)
        }
    }
    
    @objc func nextScreen(){
        let third = OnboardingThirdViewController()
        navigationController?.pushViewController(third, animated: true)
    }
    
    func propertiesAssignment(){
        skipLabel.text = "Skip"
        skipLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        experienceLabel.text = "Experience"
        experienceLabel.font = .systemFont(ofSize: 25, weight: .medium)
        
        subExperienceLabel.text = "How will you consider your investment experience?"
        subExperienceLabel.font = UIFont(name: "Lato", size: 16)
        subExperienceLabel.numberOfLines = 0
        subExperienceLabel.lineBreakMode = .byWordWrapping
        
        beginnerLabelCheckBox.text = "Beginner"
        amateurLabelCheckBox.text = "Amateur"
        intermediateLabelCheckBox.text = "Intermediate"
        expertLabelCheckBox.text = "Expert"
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.tintColor = .white
        
        for labelContainers in containers{
            //labelContainers.layer.shadowColor = UIColor.black.cgColor
            labelContainers.layer.shadowOpacity = 0.2
            labelContainers.layer.shadowOffset = CGSize(width: 0, height: 2)
            labelContainers.layer.shadowRadius = 4
        }
        
    }
    
    @IBAction func beginCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
        /*updateNextButtonState*/()
    }
    
    @IBAction func amateurCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
        /*updateNextButtonState*/()
    }
    
    @IBAction func intermediateCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
        /*updateNextButtonState*/()
    }
    
    @IBAction func expertCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
        /*updateNextButtonState*/()
    }
}
    

