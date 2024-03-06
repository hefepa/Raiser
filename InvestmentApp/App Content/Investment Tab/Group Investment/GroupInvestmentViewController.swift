//
//  GroupInvestmentViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 13/02/2024.
//

import UIKit
import Toast

class GroupInvestmentViewController: UIViewController, CustomAlertDelegate, SouceOfFundingViewDelegate, SuccessViewControllerDelegate, PinViewControllerDelegate {
    func portfolioLabelTapped() {
        let nextViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: nextViewController)
        self.present(navigationController, animated: true, completion: nil)
//    }
//        let homeVC = HomeViewController()
//        homeVC.hidesBottomBarWhenPushed = false
//        navigationController?.pushViewController(homeVC, animated:  true)
        
    }
    
    
    func continueButtonTapped() {
        dismiss(animated: true) {
            let successVC = SuccessViewController()
            successVC.delegate = self
            self.present(successVC, animated: false, completion: nil)
        }
    }

    func showEnterPinView() {
        sourceOfFundingVC?.dismiss(animated: true)
        let enterPinView =  PinViewController()
        enterPinView.delegate = self
//        enterPinView.modalPresentationStyle = .overFullScreen
        self.present(enterPinView, animated: false, completion: nil)
    }
    
    
    func continueButton() {
        let joinGroupVC = JoinGroupViewController()
        navigationController?.popViewController(animated: false)
    }
    
    
//    func purchaseButtonTapped() {
//        sourceOfFundingVC?.dismiss(animated: true)
//        let successVC = SuccessViewController()
//        successVC.delegate = self
////        successVC.sheetPresentationController?.prefersGrabberVisible = true
//        self.present(successVC, animated: false, completion: nil)
//    }
    

    var btn = ButtonColor()
    var getData: JoinGroupProperties?
    let investmentCollectionViewCell = InvestmentCollectionViewCell()
    
    var sourceOfFundingVC: SourceOfFundingViewController?
    var successVC: SuccessViewController?
//    var pinVC: PinViewController?
    
    @IBOutlet weak var investmentGroupName: UILabel!
    @IBOutlet weak var investmentAndAboutCollection: UICollectionView!
    @IBOutlet weak var investmentButtonScroll: UIButton!
    @IBOutlet weak var aboutButtonScroll: UIButton!
    @IBOutlet weak var moreInfoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.title = "Group Investment"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backicon"), style: .done, target: self, action: #selector(backNavigation))
        
        investmentAndAboutCollection.register(UINib(nibName: "InvestmentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InvestmentCollectionViewCell")
        investmentAndAboutCollection.register(UINib(nibName: "AboutCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AboutCollectionViewCell")
        investmentAndAboutCollection.delegate = self
        investmentAndAboutCollection.dataSource = self
        investmentAndAboutCollection.isScrollEnabled = false
       
        investmentGroupName.text = getData?.name
        propertiesAssigment()
        
        setupKeyboardDismissRecognizer()
        investmentCollectionViewCell.delegate = self
//        successVC?.delegate = self
        investmentButtonScroll.tintColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)
    }
    
    
    @IBAction func investButtonToScroll(_ sender: UIButton){
        
        investmentButtonScroll.layer.borderWidth = 2
        investmentButtonScroll.layer.borderColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1).cgColor
        investmentButtonScroll.tintColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)
        investmentButtonScroll.layer.borderWidth = .nan
        aboutButtonScroll.layer.borderColor = .none
        aboutButtonScroll.tintColor = .black
        let indexPath = IndexPath(item: 0, section: 0)
        investmentAndAboutCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func aboutButtonToScroll(_ sender: UIButton){
        
        aboutButtonScroll.layer.borderWidth = 2
        aboutButtonScroll.layer.borderColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1).cgColor
        aboutButtonScroll.tintColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)
        aboutButtonScroll.layer.borderWidth = .nan
        investmentButtonScroll.layer.borderColor = .none
        investmentButtonScroll.tintColor = .black
        let indexPath = IndexPath(item: 1, section: 0)
        investmentAndAboutCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    @objc func backNavigation(){
        navigationController?.popViewController(animated: true)
    }
    
    func showSourceOfFunding() {
        let sourceOfFunding = SourceOfFundingViewController()
        sourceOfFunding.delegate = self
        self.sourceOfFundingVC = sourceOfFunding
        present(sourceOfFunding, animated: true)
    }
    
    func showCustomAlert() {
        let customAlert = CustomAlertViewController()
        customAlert.modalPresentationStyle = .overFullScreen
        present(customAlert, animated: true, completion: nil)
    }
    
    func addBottomBorder(to button: UIButton, color: UIColor, thickness: CGFloat) {
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: 0, y: button.frame.size.height - thickness, width: 200, height: thickness)
            button.layer.addSublayer(border)
        }
    
    
    func propertiesAssigment(){
        
        investmentButtonScroll.setTitle("Investment", for: .normal)
        investmentButtonScroll.tintColor = .black
        
        aboutButtonScroll.setTitle("About", for: .normal)
        aboutButtonScroll.tintColor = .black
        moreInfoLabel.font = .systemFont(ofSize: 12, weight: .light)
//        
        
        let attributedString = NSMutableAttributedString(string: "New to investing? No problem! Check out our Learn page to kick-start your investment journey with valuable resources and insights tailored for beginners. We're here to help you every step of the way as you embark on your journey towards financial growth and prosperity.")
        
        let wordToColor = "Learn"
        let range = (attributedString.string as NSString).range(of: wordToColor)
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: range)
        
        // Apply the attributed string to the UILabel
        moreInfoLabel.attributedText = attributedString
        
        // Enable user interaction on the label
        moreInfoLabel.isUserInteractionEnabled = true
        
        // Add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        moreInfoLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func labelTapped() {
        // Handle the tap action, e.g., navigate to another view controller
        print("Learn label tapped!")
        // Add your navigation logic or any action you want to perform when the label is tapped
    }
}


extension GroupInvestmentViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            let investmentCell = investmentAndAboutCollection.dequeueReusableCell(withReuseIdentifier: "InvestmentCollectionViewCell", for: indexPath) as! InvestmentCollectionViewCell
            investmentCell.delegate = self  // Set the delegate here
            if let duration = getData?.duration, let interestRate = getData?.interestRate {
                investmentCell.investTimeFrameTF.text = "\(duration) days at \(interestRate)%"
                print("Duration:\(duration)")
                print("interest:\(interestRate)")
                
                if let minimumCapital = getData?.minimumCapital, let maximumCapital = getData?.maximumCapital {
                    investmentCell.minimumLabel.text = "Min. amount of \(minimumCapital) and Max amount of \(maximumCapital)"
                    UserDefaults.standard.set(minimumCapital, forKey: "Minimumcapital")
                    UserDefaults.standard.set(maximumCapital, forKey: "Maximumcapital")
                    
                } else {
                    // Handle the case where minimumCapital is nil
                    investmentCell.minimumLabel.text = "Minimum Capital Not Available"
                }
                
                if let investmentID = getData?.id{
                    UserDefaults.standard.set(investmentID, forKey: "InvestmentID")
                }
                
                let investmentIDResult = UserDefaults.standard.integer(forKey: "InvestmentID")
                
                print("Investment ID is: \(investmentIDResult)")
                
                let result = UserDefaults.standard.set(duration, forKey: "StoredDuration")
                let secondResult = UserDefaults.standard.set(interestRate, forKey: "StoredInterestRate")
                
                let storedDuration = UserDefaults.standard.integer(forKey: "StoredDuration")
                let storedInterestRate = UserDefaults.standard.double(forKey: "StoredInterestRate")
                
                let storedMin = UserDefaults.standard.integer(forKey: "Minimumcapital")
                let storedMax = UserDefaults.standard.double(forKey: "Maximumcapital")
                
                print("Result is:\(storedMin)")
                print("SResult is:\(storedMax)")
                
                print("Result is:\(storedDuration)")
                print("SResult is:\(storedInterestRate)")
                return investmentCell
            }
        }else if indexPath.item == 1{
                let aboutCell = investmentAndAboutCollection.dequeueReusableCell(withReuseIdentifier: "AboutCollectionViewCell", for: indexPath) as! AboutCollectionViewCell
                return aboutCell
            }
            return UICollectionViewCell()
        }
    }

    
    
    extension GroupInvestmentViewController: UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let widthOfScreen: CGFloat = collectionView.bounds.width
            let heightOfScreen = collectionView.bounds.height
            return CGSize(width: widthOfScreen, height: heightOfScreen)
        }
    }




    //            let contentOfRate = getData?.rate
    //
    //            // Split the sentence by spaces
    //            let components = contentOfRate?.components(separatedBy: " ")
    //            print(components)
    //            // Check if there are at least 1 space
    //            if components?.count ?? 0 >= 2 {
    //                // Join the components starting from the fourth element
    //                let contentAfterSecondSpace = components?[1...].joined(separator: " ")
    //                print(contentAfterSecondSpace)
    //                investmentCell.investTimeFrameTF.text = ("\(getData?.days ?? "0 day") " + (contentAfterSecondSpace ?? "0%"))
    //                print(investmentCell.investTimeFrameTF.text!)
    //
    //                investmentCell.delegate = self
