//
//  PinViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 04/03/2024.
//

import UIKit
import Toast

protocol PinViewControllerDelegate: AnyObject{
    func continueButtonTapped()
}


class PinViewController: UIViewController, ROIModelDelegate, UITextFieldDelegate {
   
    func showEnterPinView() {
        print("Pin entered")
    }
    
    
    func DidReceivedResponse(data: ROIResponseModel?) {
        DispatchQueue.main.async{ [weak self] in
            if data?.success == true{
                self?.activityLoader.stopAnimating()
                //                self?.activityLoader.stopAnimating()
                print("message is: \(data?.message)")
                print("Purchase successful")
                self?.delegate?.continueButtonTapped()
//                let successVC = SuccessViewController()
//                self?.present(successVC, animated: true)
                NotificationCenter.default.post(name: Notification.Name("RefreshPortFolio"), object: nil)
                
                
            }else{
                print("message error is:\(data?.message)")
                let customAlert = CustomAlertViewController()
                customAlert.checkMarkImage.image = UIImage(systemName: "xmark")
                customAlert.successLabel.text = "Fail!"
                customAlert.subSuccessLabel.text = "Failed, try again"
            }
        }
    }
    
    func DidReceiveError(error: String) {
        print("error")
    }
    
    
    
    @IBOutlet weak var pinTF: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var container: UIView!
    
    let activityLoader = UIActivityIndicatorView(style: .large)
    
    weak var delegate: PinViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupKeyboardDismissRecognizer()

        
        view.backgroundColor = UIColor(red: 0.102, green: 0.102, blue: 0.102, alpha: 0.2).withAlphaComponent(0.1)
        
//        container.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        continueBtn.backgroundColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        continueBtn.setTitle("Continue", for: .normal)
        continueBtn.tintColor = .white
        pinTF.delegate = self
        pinTF.isSecureTextEntry = true
        pinTF.placeholder = "Enter your pin"
        pinTF.layer.borderWidth = 2
        pinTF.layer.borderColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1).cgColor
        container.layer.cornerRadius = 10
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.count ?? 0) + string.count - range.length
               return newLength <= 4
    }
    func toastNotification(){
        let config = ToastConfiguration(
            direction: .top,
            dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
            animationTime: 0.2
        )
    }
   
   
    
    @IBAction func continueTapped(_ sender: Any) {
        Task { @MainActor in
           
            
            let pinTextField = pinTF.text
            
            if pinTextField?.isEmpty ?? true {
                toastNotification()
                let toast = Toast.default(
                    image: UIImage(systemName: "xmark.circle.fill")!, title: "Enter your pin")
                toast.show()
                print("Enter pin")
            }else{
                let result = UserDefaults.standard.value(forKey: "CalculatedValue") as? Double
                
                let retrievedNumericAmount = UserDefaults.standard.value(forKey: "savedNumericAmount") as? Double
                
                let investmentID = UserDefaults.standard.integer(forKey: "InvestmentID")
                let userDetailsID = UserDefaults.standard.integer(forKey: "UserID")
                guard let storedDuration = UserDefaults.standard.string(forKey: "StoredDuration"),
                      let duration = Int(storedDuration),  let storedInterestRate = UserDefaults.standard.value(forKey: "StoredInterestRate") as? Double else {
                    print("Stored duration or interest rate is missing or not a positive value")
                    return
                }
                let viewModel = ROIViewModel()
                viewModel.delegate = self
                try await viewModel.purchaseInvestment(
                    userDetails: userDetailsID,
                    investmentId: investmentID,
                    amountEntered: retrievedNumericAmount ?? 0,
                    days: duration,
                    rate: Decimal(storedInterestRate),
                    expectedReturns: result ?? 0
                )
                delegate?.continueButtonTapped()
                
                //                    self.delegate?.showCustomAlert()
                
            }
            activityLoader.startAnimating()
        }
    }
}
        



