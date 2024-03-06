//
//  ExistingOrNewUserViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 03/03/2024.
//

import UIKit

class ExistingOrNewUserViewController: UIViewController {

    @IBOutlet weak var raiserImage: UIImageView!
    @IBOutlet weak var newUserButton: UIButton!
    @IBOutlet weak var existingUserButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        raiserImage.image = UIImage(named: "raiser 1")
        
        newUserButton.setTitle("A new User", for: .normal)
        newUserButton.backgroundColor = .white
        newUserButton.tintColor = .black
        newUserButton.layer.borderWidth = 1.0
        newUserButton.layer.borderColor =  UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1).cgColor
        
        existingUserButton.setTitle("An already existing ALAT User", for: .normal)
        existingUserButton.backgroundColor = .white
        existingUserButton.tintColor = .black
        existingUserButton.layer.borderWidth = 1.0
        existingUserButton.layer.borderColor =  UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1).cgColor
        
    }

    @IBAction func newUserButtonTapped(_ sender: Any) {
        let signUpPage = SignUpViewController()
        navigationController?.pushViewController(signUpPage, animated: true)
    }
    
    @IBAction func existingUserButtonTapped(_ sender: Any) {
        let loginPage = NewLoginViewController()
        navigationController?.pushViewController(loginPage, animated: true)
    }
    

}
