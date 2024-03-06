//
//  SuccessViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 01/03/2024.
//

import UIKit

protocol SuccessViewControllerDelegate: AnyObject{
//    func showSuccessVC()
    func continueButton()
    func portfolioLabelTapped()
}


class SuccessViewController: UIViewController {
    
    @IBOutlet weak var successImage: UIImageView!
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var subSuccessLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var viewPortfolioLabel: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    
    weak var delegate: SuccessViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        propertiesAssignment()
    }
    
    func propertiesAssignment(){
        view.backgroundColor = UIColor(red: 0.102, green: 0.102, blue: 0.102, alpha: 0.2).withAlphaComponent(0.1)
        
        successImage.image = UIImage(named: "successicon")
        
        successLabel.text = "Success!"
        successLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        successLabel.numberOfLines = 0
        successLabel.lineBreakMode = .byWordWrapping
        
        subSuccessLabel.text = "Congratulations, your investment has been successfully created."
        subSuccessLabel.font = .systemFont(ofSize: 15, weight: .light)
        subSuccessLabel.numberOfLines = 0
        subSuccessLabel.lineBreakMode = .byWordWrapping
        subSuccessLabel.textAlignment = .center
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.backgroundColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        continueButton.tintColor = .white
        continueButton.layer.cornerRadius = 2
        
        viewPortfolioLabel.text = "View Portfolio"
        viewPortfolioLabel.font = .systemFont(ofSize: 12, weight: .regular)
        viewPortfolioLabel.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        
        viewContainer.backgroundColor = .white
        
        let viewPortfolio = UITapGestureRecognizer(target: self, action: #selector(viewPortfolioTapped))
        viewPortfolioLabel.isUserInteractionEnabled = true
        viewPortfolioLabel.addGestureRecognizer(viewPortfolio)
    }
    
    @objc func viewPortfolioTapped(){
        dismiss(animated: true)
        delegate?.portfolioLabelTapped()
    }
    
    @IBAction func continueButton(_ sender: Any) {
        dismiss(animated: true)
        delegate?.continueButton()
    }
}
