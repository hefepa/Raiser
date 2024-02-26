//
//  NewOrExistingUserViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 25/02/2024.
//

import UIKit
protocol NewOrExistingUserDelegate: AnyObject{
    func newUserButtonTapped()
    func existingUserButtonTapped()
}

class NewOrExistingUserViewController: UIViewController {
    
    @IBOutlet weak var newUserButton: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var existingUserButton: UIButton!
    
    weak var delegate: NewOrExistingUserDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.102, green: 0.102, blue: 0.102, alpha: 0.2).withAlphaComponent(0.1)

        viewContainer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        
        newUserButton.setTitle("A new User", for: .normal)
        newUserButton.tintColor = .black
        newUserButton.layer.borderWidth = 2
        newUserButton.layer.borderColor =  UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1).cgColor
        
        existingUserButton.setTitle("An already existing User", for: .normal)
        existingUserButton.tintColor = .black
        existingUserButton.layer.borderWidth = 2
        existingUserButton.layer.borderColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1).cgColor
        

        

    }

    @IBAction func newUserButtonTapped(_ sender: Any) {
        delegate?.newUserButtonTapped()
        dismiss(animated: true)
    }
    
    @IBAction func existingUserButtonTapped(_ sender: Any) {
        delegate?.existingUserButtonTapped()
        dismiss(animated: true)
    }
    

}
