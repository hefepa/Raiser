//
//  InvestmentCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 16/02/2024.
//

import UIKit
import Toast

protocol CustomAlertDelegate: AnyObject {
    func showCustomAlert()
    func showSourceOfFunding()
}


class InvestmentCollectionViewCell: UICollectionViewCell, UITextFieldDelegate /*ROIModelDelegate*/ {
//    func DidReceivedResponse(data: ROIResponseModel?) {
//        DispatchQueue.main.async{ [weak self] in
//            if data?.success == true{
//                self?.activityLoader.stopAnimating()
//                print("message is: \(data?.message)")
//                //            delegate?.showCustomAlert()
//                self?.activityLoader.stopAnimating()
//                self?.activityLoader.hidesWhenStopped = true
//                NotificationCenter.default.post(name: Notification.Name("RefreshPortFolio"), object: nil)
//                
//                
//            }else{
//                print("message error is:\(data?.message)")
//                let customAlert = CustomAlertViewController()
//                customAlert.checkMarkImage.image = UIImage(systemName: "xmark")
//                customAlert.successLabel.text = "Fail!"
//                customAlert.subSuccessLabel.text = "Failed, try again"
//                self?.delegate?.showCustomAlert()
//            }
//        }
//        
//    }
//    
//    func DidReceiveError(error: String) {
//        activityLoader.stopAnimating()
//        print("error")
//    }
    
    
    var getData: JoinGroupProperties?
    weak var delegate: CustomAlertDelegate?
    var joinGroupViewModel = JoinGroupViewModel(joinGroupNetworkCall: JoinGroupNetworkCall())
    let activityLoader = UIActivityIndicatorView(style: .large)
    
    @IBOutlet weak var amountToInvestLabel: UILabel!
    @IBOutlet weak var amountToInvestTF: UITextField!
    @IBOutlet weak var minimumImage: UIImageView!
    @IBOutlet weak var minimumLabel: UILabel!
    @IBOutlet weak var investTimeFrameLabel: UILabel!
    @IBOutlet weak var investTimeFrameTF: UITextField!
    @IBOutlet weak var expectedReturnsLabel: UILabel!
    @IBOutlet weak var expectedReturnsTF: UITextField!
    @IBOutlet weak var investButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let groupInvestment = GroupInvestmentViewController()
        groupInvestment.view.addSubview(activityLoader)
        activityLoader.center = groupInvestment.view.center
        //        addSubview(activityLoader)
        activityLoader.center = self.contentView.center
        
        amountToInvestTF.delegate = self
        propertiesAssigment()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == amountToInvestTF {
            let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            Task {
                // Place the logic directly here without calling updateExpectedReturns
                guard let numericAmount = Double(updatedText) else {
                    print("Invalid Input")
                    expectedReturnsTF.text = ""
                    return
                }
                
                let storedMinimumCapital = UserDefaults.standard.double(forKey: "Minimumcapital")
                let storedMaximumCapital = UserDefaults.standard.double(forKey: "Maximumcapital")
                
                guard storedMinimumCapital...storedMaximumCapital ~= numericAmount else {
                    print("Entered amount is outside the range of \(storedMinimumCapital) to \(storedMaximumCapital)")
                    expectedReturnsTF.text = ""
                    return
                }
                
                guard let storedDuration = UserDefaults.standard.string(forKey: "StoredDuration"),
                      let duration = Int(storedDuration),
                      let storedInterestRate = UserDefaults.standard.value(forKey: "StoredInterestRate") as? Double else {
                    print("Stored duration or interest rate is missing or not a positive value")
                    return
                }
                
                let calculatedValue = (numericAmount * storedInterestRate) / 100
                expectedReturnsTF.text = String(calculatedValue)
                
                let investmentID = UserDefaults.standard.integer(forKey: "InvestmentID")
                let userDetailsID = UserDefaults.standard.integer(forKey: "UserID")
            }
        }
        return true
    }
    
    @IBAction func investButtonTapped(_ sender: Any) {
        
        //        @IBAction func investButtonTapped(_ sender: Any) {
        Task { @MainActor in
            guard let enteredAmount = amountToInvestTF.text, let numericAmount = Double(enteredAmount), !enteredAmount.isEmpty else {
                toastNotification()
                let toast = Toast.default(
                    image: UIImage(systemName: "xmark.circle.fill")!, title: "Field is empty")
                toast.show()
                activityLoader.stopAnimating()
                print("Entered amount is empty or nil")
                return
                
            }
            UserDefaults.standard.set(numericAmount, forKey: "savedNumericAmount")
            
            
            
            let storedMinimumCapital = UserDefaults.standard.double(forKey: "Minimumcapital")
            let storedMaximumCapital = UserDefaults.standard.double(forKey: "Maximumcapital")
            
            guard storedMinimumCapital...storedMaximumCapital ~= numericAmount else {
                toastNotification()
                let toast = Toast.default(
                    image: UIImage(systemName: "xmark.circle.fill")!, title: "Amount out of range")
                toast.show()
                activityLoader.stopAnimating()
                print("Entered amount is outside the range of \(storedMinimumCapital) to \(storedMaximumCapital)")
                expectedReturnsTF.text = ""
                return
            }
            
            guard let storedDuration = UserDefaults.standard.string(forKey: "StoredDuration"),
                  let duration = Int(storedDuration),
                  let storedInterestRate = UserDefaults.standard.value(forKey: "StoredInterestRate") as? Double else {
                print("Stored duration or interest rate is missing or not a positive value")
                return
            }
            
            let calculatedValue = (numericAmount * storedInterestRate) / 100
            expectedReturnsTF.text = String(calculatedValue)
            let investmentID = UserDefaults.standard.integer(forKey: "InvestmentID")
            let userDetailsID = UserDefaults.standard.integer(forKey: "UserID")
            
            let calValue = UserDefaults.standard.set(calculatedValue, forKey: "CalculatedValue")
            
            
            delegate?.showSourceOfFunding()
            
    
//              do {
//                  let viewModel = ROIViewModel()
//                  viewModel.delegate = self
//                  try await viewModel.purchaseInvestment(
//                      userDetails: userDetailsID,
//                      investmentId: investmentID,
//                      amountEntered: numericAmount,
//                      days: duration,
//                      rate: Decimal(storedInterestRate),
//                      expectedReturns: calculatedValue
//                  )
//    
//                  // If the purchaseInvestment is successful, show the custom alert
//                    delegate?.showCustomAlert()
//    
//    
//              } catch {
//                  // Handle the error if purchaseInvestment fails
//                  print("Error during purchaseInvestment: \(error)")
//              }
          }
//          activityLoader.startAnimating()
        }
    
        
        func toastNotification(){
            let config = ToastConfiguration(
                direction: .top,
                dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
                animationTime: 0.2
            )
        }
        
        
        func propertiesAssigment(){
            
            amountToInvestLabel.text = "What amount would you like to invest?"
            amountToInvestLabel.font = .systemFont(ofSize: 15, weight: .regular)
            
            amountToInvestTF.placeholder = "₦0.00"
            
            minimumImage.image = UIImage(named: "caution")
            //        minimumLabel.text = "Min. amount of ₦20,000 and Max amount of ₦100,000"
            minimumLabel.font = .systemFont(ofSize: 12, weight: .light)
            
            investTimeFrameLabel.text = "Tenure of Investment"
            investTimeFrameLabel.font = .systemFont(ofSize: 15, weight: .regular)
            
            investTimeFrameTF.isUserInteractionEnabled = false
            
            expectedReturnsLabel.text = "Expected Returns"
            expectedReturnsLabel.font = .systemFont(ofSize: 15, weight: .regular)
            expectedReturnsTF.placeholder = "₦0.00"
            
            investButton.setTitle("Invest", for: .normal)
            investButton.tintColor = .white
            investButton.backgroundColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)

            
        }
    }

