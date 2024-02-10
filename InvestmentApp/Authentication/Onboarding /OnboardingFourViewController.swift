//
//  OnboardingFourViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 06/02/2024.
//

import UIKit

class OnboardingFourViewController: UIViewController {
    
    var btn = ButtonColor()
    
    @IBOutlet var checkBoxesArray: [UIButton]!
    
    @IBOutlet weak var skipLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var subStatusLabel: UILabel!
    @IBOutlet weak var employedCheckBoxLabel: UILabel!
    @IBOutlet weak var selfEmployedCheckBoxLabel: UILabel!
    @IBOutlet weak var freelanacerCheckBoxLabel: UILabel!
    @IBOutlet weak var studentCheckBoxLabel: UILabel!
    @IBOutlet weak var unemployedCheckBoxLabel: UILabel!
    @IBOutlet var containers: [UIView]!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //KeyboardUtility.addTapGestureToDismissKeyboard(for: self)

        btn.colorConfiguration(button: nextButton)
        
        for checkboxes in checkBoxesArray{
            checkboxes.layer.cornerRadius = checkboxes.frame.height / 2
            checkboxes.setImage(UIImage(systemName: "circle")?.withRenderingMode(.alwaysTemplate), for: .normal)
            checkboxes.setImage(UIImage(named: "circletick")?.withRenderingMode(.alwaysOriginal), for: .selected)
            checkboxes.tintColor = UIColor.black
        }
        propertiesAssignment()
        updateNextButtonState()
        let skip = UITapGestureRecognizer(target: self, action: #selector(nextScreen))
        skipLabel.isUserInteractionEnabled = true
        skipLabel.addGestureRecognizer(skip)
    }
    
    func updateNextButtonState() {
        let isAnyCheckBoxSelected = checkBoxesArray.contains { $0.isSelected }
        nextButton.isEnabled = isAnyCheckBoxSelected
        nextButton.alpha = isAnyCheckBoxSelected ? 1.0 : 0.5
        }
    
    @IBAction func nextBtn(_ sender: UIButton){
        if checkBoxesArray.contains(where: { $0.isSelected }) {
            let fifth = OnboardingFiveViewController()
            navigationController?.pushViewController(fifth, animated: true)
        }
    }
    
    @objc func nextScreen(){
        let fifth = OnboardingFiveViewController()
        navigationController?.pushViewController(fifth, animated: true)
    }
    func propertiesAssignment(){
        skipLabel.text = "Skip"
        skipLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        statusLabel.text = "Status"
        statusLabel.font = .systemFont(ofSize: 25, weight: .medium)
        
        subStatusLabel.text = "Please select the option that best describes your current status"
        subStatusLabel.font = UIFont(name: "Lato", size: 16)
        subStatusLabel.numberOfLines = 0
        subStatusLabel.lineBreakMode = .byWordWrapping
        
        employedCheckBoxLabel.text = "Employed"
        selfEmployedCheckBoxLabel.text = "Self-employed"
        freelanacerCheckBoxLabel.text = "Freelancer/Creative"
        studentCheckBoxLabel.text = "Student"
        unemployedCheckBoxLabel.text = "Unemployed"
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.tintColor = .white
        
        for labelContainers in containers{
            labelContainers.layer.shadowColor = UIColor.black.cgColor
            labelContainers.layer.shadowOpacity = 0.2
            labelContainers.layer.shadowOffset = CGSize(width: 0, height: 2)
            labelContainers.layer.shadowRadius = 4
        }
    }
    
    @IBAction func employedCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
        updateNextButtonState()
    }
    
    @IBAction func selfEmployedCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
        updateNextButtonState()
    }
    
    @IBAction func freelanncerCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
        updateNextButtonState()
    }
    
    @IBAction func studentCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
        updateNextButtonState()
    }
    
    @IBAction func unemployedCheckBox(_ sender: UIButton) {
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
        updateNextButtonState()
    }
    

}
