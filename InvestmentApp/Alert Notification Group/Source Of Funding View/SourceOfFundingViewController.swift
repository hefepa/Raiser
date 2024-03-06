//
//  SourceOfFundingViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 27/02/2024.
//

import UIKit
import Toast

protocol SouceOfFundingViewDelegate: AnyObject{
//    func purchaseButtonTapped()
    func showEnterPinView()
}



class SourceOfFundingViewController: UIViewController /*ROIModelDelegate, UISheetPresentationControllerDelegate*/ {
    
//    func DidReceivedResponse(data: ROIResponseModel?) {
//        DispatchQueue.main.async{ [weak self] in
//            if data?.success == true{
////                self?.activityLoader.stopAnimating()
//                print("message is: \(data?.message)")
//                self?.delegate?.purchaseButtonTapped()
//                NotificationCenter.default.post(name: Notification.Name("RefreshPortFolio"), object: nil)
//
//                
//            }else{
//                print("message error is:\(data?.message)")
//                let customAlert = CustomAlertViewController()
//                customAlert.checkMarkImage.image = UIImage(systemName: "xmark")
//                customAlert.successLabel.text = "Fail!"
//                customAlert.subSuccessLabel.text = "Failed, try again"
//            }
//        }
//    }
    
//    func DidReceiveError(error: String) {
//        print("error")
//    }
//    
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var sourceOfFunding: UILabel!
    @IBOutlet weak var subSourceOfFunding: UILabel!
    @IBOutlet weak var firstViewContainer: UIView!
    @IBOutlet weak var walletBalanceImage: UIImageView!
    @IBOutlet weak var walletBalance: UILabel!
    @IBOutlet weak var subWalletBalance: UILabel!
    @IBOutlet weak var firstCheckButton: UIButton!
    @IBOutlet weak var debitCardImage: UIImageView!
    @IBOutlet weak var debitCard: UILabel!
    @IBOutlet weak var subDebitCard: UILabel!
    @IBOutlet weak var secondCheckButton: UIButton!
    @IBOutlet weak var secondViewContainer: UIView!
    @IBOutlet weak var closeIcon: UIImageView!
    @IBOutlet weak var puchaseButton: UIButton!
    @IBOutlet var arrayOfCheckBoxes: [UIButton]!
    
    weak var delegate: SouceOfFundingViewDelegate?
    let investmentCollectionViewCell = InvestmentCollectionViewCell()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for buttons in arrayOfCheckBoxes{
            buttons.layer.cornerRadius = buttons.frame.height / 2
            
            buttons.setImage(UIImage(systemName: "circle")?.withRenderingMode(.alwaysTemplate), for: .normal)
            buttons.setImage(UIImage(named: "circletick")?.withRenderingMode(.alwaysOriginal), for: .selected)
            buttons.layer.borderWidth = 1
            buttons.layer.borderColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1).cgColor
            buttons.tintColor = .white
            buttons.backgroundColor = .white
        }
        
        view.backgroundColor = UIColor(red: 0.102, green: 0.102, blue: 0.102, alpha: 0.2).withAlphaComponent(0.1)
        
        sourceOfFunding.text = "Source of Funding"
        sourceOfFunding.font = .systemFont(ofSize: 18, weight: .semibold)
        
        subSourceOfFunding.text = "Select a primary source of fund for your investment"
        subSourceOfFunding.font = .systemFont(ofSize: 13, weight: .light)
        
        walletBalance.text = "Wallet Balance"
        walletBalance.font = .systemFont(ofSize: 18, weight: .semibold)
        
        subWalletBalance.text = "Fund from your Raiser account"
        subWalletBalance.font = .systemFont(ofSize: 13, weight: .light)
        
        debitCard.text = "Debit Card"
        debitCard.font = .systemFont(ofSize: 18, weight: .semibold)
        
        subDebitCard.text = "Fund from your Debit Card"
        subDebitCard.font = .systemFont(ofSize: 13, weight: .light)
        
//        let closeIsTapped = UITapGestureRecognizer(target: self, action: #selector(closeIconTapped))
//        closeIcon.isUserInteractionEnabled = true
//        closeIcon.addGestureRecognizer(closeIsTapped)
        
        
        container.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        firstViewContainer.layer.shadowColor = UIColor.black.cgColor
        firstViewContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        firstViewContainer.layer.shadowOpacity = 0.5
        firstViewContainer.layer.shadowRadius = 2.0
        firstViewContainer.layer.masksToBounds = false
        
        secondViewContainer.layer.shadowColor = UIColor.black.cgColor
        secondViewContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        secondViewContainer.layer.shadowOpacity = 0.5
        secondViewContainer.layer.shadowRadius = 2.0
        secondViewContainer.layer.masksToBounds = false
        
        puchaseButton.setTitle("Purchase Investment", for: .normal)
        puchaseButton.backgroundColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        puchaseButton.layer.cornerRadius = 2
        puchaseButton.tintColor = .white

    }
    func toastNotification(){
        let config = ToastConfiguration(
            direction: .top,
            dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
            animationTime: 0.2
        )
    }
    

    @IBAction func purchaseButtonTapped(_ sender: Any) {
        
        Task { @MainActor in
            
            let isAnyCheckboxSelected = arrayOfCheckBoxes.contains { $0.isSelected }
            
            if !isAnyCheckboxSelected {
                toastNotification()
                let toast = Toast.default(
                    image: UIImage(systemName: "xmark.circle.fill")!, title: "Select a payment channel")
                toast.show()
                print("Please select a payment method")
            } else {
                do {
                    
                    let result = UserDefaults.standard.value(forKey: "CalculatedValue") as? Double
                    
                    let retrievedNumericAmount = UserDefaults.standard.value(forKey: "savedNumericAmount") as? Double
                    
                    let investmentID = UserDefaults.standard.integer(forKey: "InvestmentID")
                    let userDetailsID = UserDefaults.standard.integer(forKey: "UserID")
                    guard let storedDuration = UserDefaults.standard.string(forKey: "StoredDuration"),
                          let duration = Int(storedDuration),  let storedInterestRate = UserDefaults.standard.value(forKey: "StoredInterestRate") as? Double else {
                        print("Stored duration or interest rate is missing or not a positive value")
                        return
                    }
                    
                    delegate?.showEnterPinView()
//                    delegate?.purchaseButtonTapped()
                    
//                                        let viewModel = ROIViewModel()
//                                        viewModel.delegate = self
//                                        try await viewModel.purchaseInvestment(
//                                            userDetails: userDetailsID,
//                                            investmentId: investmentID,
//                                            amountEntered: retrievedNumericAmount ?? 0,
//                                            days: duration,
//                                            rate: Decimal(storedInterestRate),
//                                            expectedReturns: result ?? 0
//                                        )
//                    
//                    //                    self.delegate?.showCustomAlert()
//                    
//                                        print("Purchase successful")
//                    
//                                    } catch {
//                                        // Handle the error if purchaseInvestment fails
//                                        print("Error during purchaseInvestment: \(error)")
//                                    }
                }
                
            }
        }
    }
    
    
    @IBAction func firstCheckBoxTapped(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        for checkbox in arrayOfCheckBoxes {
            if checkbox != sender {
                checkbox.isSelected = false
            }
        }
    }
    
   
    @IBAction func secondCheckBoxTapped(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        for checkbox in arrayOfCheckBoxes {
            if checkbox != sender {
                checkbox.isSelected = false
            }
        }
        
    }
    
}
