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
        //KeyboardUtility.addTapGestureToDismissKeyboard(for: self)

        btn.colorConfiguration(button: nextButton)
        
        for buttons in checkBoxesArray{
            buttons.setImage(UIImage(systemName: "square")?.withRenderingMode(.alwaysTemplate), for: .normal)
            buttons.setImage(UIImage(named: "tick")?.withRenderingMode(.alwaysOriginal), for: .selected)
            //buttons.tintColor = UIColor.black
        }
        propertiesAssignment()
//        updateNextButtonState()
        
        let skip = UITapGestureRecognizer(target: self, action: #selector(nextScreen))
        skipLabel.isUserInteractionEnabled = true
        skipLabel.addGestureRecognizer(skip)
    }
   
//    func updateNextButtonState() {
//        let isAnyCheckBoxSelected = checkBoxesArray.contains { $0.isSelected }
//        nextButton.isEnabled = isAnyCheckBoxSelected
//        nextButton.alpha = isAnyCheckBoxSelected ? 1.0 : 0.5
//        }
    
    @IBAction func nextBtn(_ sender: UIButton){
        if checkBoxesArray.contains(where: { $0.isSelected }) {
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
//        updateNextButtonState()
    }
    
    @IBAction func realEstateCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
//        updateNextButtonState()
    }
    
    @IBAction func stocksCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
//        updateNextButtonState()
    }
    
    @IBAction func dollarCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
//        updateNextButtonState()
    }
    
    @IBAction func mutualFundsCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
//        updateNextButtonState()
    }
    
    @IBAction func noIdeaCheckBox(_ sender: UIButton) {
        
        checkBoxesArray.forEach {
            $0.isSelected = false
        }
        sender.isSelected = !sender.isSelected
//        if sender.isSelected{
//            for checkboxes in checkBoxesArray{
//                checkboxes.isSelected = false
//            }
//            }else{
//                sender.isSelected /*= !sender.isSelected*/
//
//        }
    }
}
