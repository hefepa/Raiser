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
    
    var okAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        successLabel.text = "Success"
        subSuccessLabel.text = "Congratulations, your Investment has been successfully created."
        checkMarkImage.image = UIImage(named: "wema")
        continueButton.setTitle("Continue", for: .normal)
        continueButton.tintColor = .white
        btn.colorConfiguration(button: continueButton)
        
        continueButton.addTarget(self, action: #selector(continueBtnTapped), for: .touchUpInside)
        /*centerAlertOnScreen*/()
    }
    
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        dismiss(animated: true){
            self.okAction?()
        }
    }
    
    func centerAlertOnScreen() {
             //Center the alert's container view within its parent view
        view.center = view.superview?.center ?? CGPoint.zero
        }
    func presentWithFadeEffect(on viewController: UIViewController) {
        let backgroundView = UIView(frame: viewController.view.bounds)
                backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
                backgroundView.tag = 123 // Assign a tag to identify and remove it later

                // Present the background view
                viewController.view.addSubview(backgroundView)

                // Present the alert on top of the background view
        modalPresentationStyle = .overCurrentContext
                modalTransitionStyle = .crossDissolve
                viewController.present(self, animated: true) {
                    // Additional setup or animations after the alert is presented, if needed
                }
        }
    }

