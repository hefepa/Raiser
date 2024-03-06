//
//  TermsAndConditionsViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 03/03/2024.
//

import UIKit

class TermsAndConditionsViewController: UIViewController {

    @IBOutlet weak var termAndConditionsContent: UITextView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.102, green: 0.102, blue: 0.102, alpha: 0.2).withAlphaComponent(0.1)
        container.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.tintColor = .white
        continueButton.backgroundColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)

    }

    @IBAction func continueButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
