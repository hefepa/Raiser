//
//  GroupInvestmentViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 13/02/2024.
//

import UIKit

class GroupInvestmentViewController: UIViewController {
    var btn = ButtonColor()
    var getData: JoinGroupProperties?
    var customAlert = CustomAlertViewController()
    
    @IBOutlet weak var investmentGroupName: UILabel!
    @IBOutlet weak var investmentAndAboutCollection: UICollectionView!
    @IBOutlet weak var investmentButtonScroll: UIButton!
    @IBOutlet weak var aboutButtonScroll: UIButton!
    @IBOutlet weak var moreInfoLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        /*showCustomAlert*/()

    }
    
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

    }
    
    @IBAction func investButtonToScroll(_ sender: UIButton){
        let indexPath = IndexPath(item: 0, section: 0)
        investmentAndAboutCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        addBottomBorder(to: investmentButtonScroll, color: UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1), thickness: 2.0)
        aboutButtonScroll.layer.borderWidth = .nan
        aboutButtonScroll.layer.borderColor = .none
    }
    
    @IBAction func aboutButtonToScroll(_ sender: UIButton){
        let indexPath = IndexPath(item: 1, section: 0)
        investmentAndAboutCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        addBottomBorder(to: aboutButtonScroll, color: UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1), thickness: 2.0)
        investmentButtonScroll.layer.borderWidth = .nan
        investmentButtonScroll.layer.borderColor = .none
        addBottomBorder(to: investmentButtonScroll, color: .white, thickness: 0)

    }
    
    @IBAction func investButtonTapped(_ sender: UIButton) {
        let customAlertVC = CustomAlertViewController(nibName: "CustomAlertViewController", bundle: nil)
//        customAlertVC.modalPresentationStyle = .pageSheet
//        customAlertVC.modalTransitionStyle = .crossDissolve
        customAlertVC.okAction = {
            print("Button Tapped")
        }
        customAlertVC.presentWithFadeEffect(on: self)

        //present(customAlertVC, animated: true, completion: nil)

        
    }

    @objc func backNavigation(){
        navigationController?.popViewController(animated: true)
    }
    
//    func showCustomAlert(){
//        
//        // Load the CustomAlertViewController from the XIB
//        // Load the CustomAlertViewController from the XIB
//        if let customAlertViewController = CustomAlertViewController(nibName: "CustomAlertView", bundle: nil) as CustomAlertViewController? {
//                // Set action for OK button if needed
//                customAlertViewController.okAction = {
//                    // Handle OK button tap
//                    print("OK Button Tapped")
//                }
//
//                // Present the custom alert view modally
//                present(customAlertViewController, animated: true, completion: nil)
//            }
        
    
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//        alertController.setValue(customAlert, forKey: "viewAlert")
//        present(alertController, animated: true, completion: nil)
//        
//        customAlert.continueButton.addTarget(self, action: #selector(continueBtnTapped), for: .touchUpInside)
   // }
    
    
    
//    @IBAction func investButtonTapped(_ sender: Any) {
//        
//        showCustomAlert()
//        
//        
//    }
    
    
    
    
    
    
    
    
    
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
            
            let contentOfRate = getData?.rate
            
            // Split the sentence by spaces
            let components = contentOfRate?.components(separatedBy: " ")
            print(components)
            // Check if there are at least 1 space
            if components?.count ?? 0 >= 2 {
                // Join the components starting from the fourth element
                let contentAfterSecondSpace = components?[1...].joined(separator: " ")
                print(contentAfterSecondSpace)
                investmentCell.investTimeFrameTF.text = ("\(getData?.days ?? "0 day") " + (contentAfterSecondSpace ?? "0%"))
                print(investmentCell.investTimeFrameTF.text!)
            }
            return investmentCell
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

