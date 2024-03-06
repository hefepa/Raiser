//
//  AccountDetailsViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 27/02/2024.
//

import UIKit

class AccountDetailsViewController: UIViewController {
    
    var numberOfCellsInWalletCollectionView: [WalletProperties] = WalletModel().populateData()
    
    @IBOutlet weak var walletCollectionView: UICollectionView!
//    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var walletLabel: UILabel!
    @IBOutlet weak var walletAmount: UILabel!
    @IBOutlet weak var accountNumber: UILabel!
    @IBOutlet weak var copyImage: UIImageView!
    @IBOutlet weak var hideimage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var walletDetails: UILabel!
    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var accountNameTF: UITextField!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var accountNumberTF: UITextField!
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var bankNameTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        propertiesAssignment()
        
        walletCollectionView.dataSource = self
        walletCollectionView.delegate = self
        
        walletCollectionView.layer.shadowColor = UIColor.black.cgColor
        walletCollectionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        walletCollectionView.layer.shadowOpacity = 0.5
        walletCollectionView.layer.shadowRadius = 1.0
        walletCollectionView.layer.masksToBounds = false
        
        walletCollectionView.register(UINib(nibName: "WalletCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WalletCollectionViewCell")
        

    }


    func propertiesAssignment(){
        
        let storedUserName = UserDefaults.standard.string(forKey: "UserName")

        
        profileName.text = storedUserName
        
        walletLabel.text = "Wallet"
        walletLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        walletLabel.textColor = .white
        
        walletAmount.text = "₦ 450,000"
        walletAmount.font = .systemFont(ofSize: 15, weight: .semibold)
        walletAmount.textColor = .white
        
        accountNumber.text = "0123456789"
        accountNumber.font = .systemFont(ofSize: 13, weight: .semibold)
        accountNumber.textColor = .white
        
        let retrievedFirstName = UserDefaults.standard.string(forKey: "FirstName")
        let retrievedLastName = UserDefaults.standard.string(forKey: "LastName")

        
        accountNameTF.text = "\(retrievedFirstName ?? "nil")" + " \(retrievedLastName ?? "nil")"
        accountNameTF.isUserInteractionEnabled = false

        
        hideimage.tintColor = .white
        
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.layer.shadowColor = UIColor.white.cgColor
        backgroundImage.layer.shadowOpacity = 5
        backgroundImage.layer.shadowOffset = CGSize(width: 2, height: 2)
        backgroundImage.layer.shadowRadius = 5
        
        walletDetails.text = "Wallet Details"
        walletDetails.font = .systemFont(ofSize: 14, weight: .regular)
        walletDetails.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        
        accountName.text = "Account Name"
        accountName.font = .systemFont(ofSize: 14, weight: .regular)
        accountName.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        
        accountNumberLabel.text = "Account Number"
        accountNumberLabel.font = .systemFont(ofSize: 14, weight: .regular)
        accountNumberLabel.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        accountNumberTF.text = "0123456789"
        accountNumberTF.isUserInteractionEnabled = false
        
        bankName.text = "Bank Name"
        bankName.font = .systemFont(ofSize: 14, weight: .regular)
        bankName.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        bankNameTF.text = "WEMA Bank PLC"
        bankNameTF.isUserInteractionEnabled = false

    }

}

extension AccountDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfCellsInWalletCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = walletCollectionView.dequeueReusableCell(withReuseIdentifier: "WalletCollectionViewCell", for: indexPath) as! WalletCollectionViewCell
        cell.setupData(with: numberOfCellsInWalletCollectionView[indexPath.item])
        return cell
    }
}

extension AccountDetailsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthOfTheScreen = collectionView.bounds.width
        return CGSize(width: (widthOfTheScreen - 20)/4, height: collectionView.bounds.height)
    }

}



//extension AccountDetailsViewController: LoginModelDelegate{
//    func DidReceivedResponse(data: LoginResponseModel?) {
//        let firstName = data?.userDetails?.firstName
//        let lastName = data?.userDetails?.lastName
//        
//        let storedFirstName: Void = UserDefaults.standard.set(firstName, forKey: "FirstName")
//        let storedLastName: Void = UserDefaults.standard.set(firstName, forKey: "LastName")
//    }
//    
//    func DidReceiveError(error: String) {
//        "error"
//    }
//    
//    
//}
