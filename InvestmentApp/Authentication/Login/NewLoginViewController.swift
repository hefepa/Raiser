//
//  NewLoginViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 26/02/2024.
//

import UIKit
import Toast

class NewLoginViewController: UIViewController, LoginModelDelegate, UITextFieldDelegate {
    func DidReceivedResponse(data: LoginResponseModel?) {
        
        DispatchQueue.main.async{
            self.activityLoader.hidesWhenStopped = true
            self.activityLoader.stopAnimating()
            
            let userId = data?.userId
            UserDefaults.standard.set(userId, forKey: "UserID")
            let storedUserID = UserDefaults.standard.integer(forKey: "UserID")
            print("User ID is: \(storedUserID)")
            
            let userName = data?.userDetails?.firstName
            UserDefaults.standard.set(userName, forKey: "UserName")
            let storedUserName = UserDefaults.standard.string(forKey: "UserName")
            print("UserName is: \(storedUserName ?? "null")")
            
            let firstName = data?.userDetails?.firstName
            let lastName = data?.userDetails?.lastName
            
            let storedFirstName: Void = UserDefaults.standard.set(firstName, forKey: "FirstName")
            let storedLastName: Void = UserDefaults.standard.set(lastName, forKey: "LastName")
            
            
            if let token = data?.token{
                print("Login Success message:", token)
                let config = ToastConfiguration(
                    direction: .top,
                    dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
                    animationTime: 0.2
                )
                let toast = Toast.default(
                    image: UIImage(systemName: "checkmark.shield.fill")!, title: "Login Successful")
                toast.show()
                
                //                let isOnboardingSkipped = UserDefaults.standard.bool(forKey: "IsOnboardingSkipped")
                
                let onboarding = OnboardingViewController()
                self.navigationController?.pushViewController(onboarding, animated: true)
                print("Login Success message:", token)
            }else if data?.success == false{
                let config = ToastConfiguration(
                    direction: .top,
                    dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
                    animationTime: 0.2
                )
                //                if let message = data?.message else {
                //                    return
                //                }
                let toast = Toast.default(
                    image: UIImage(systemName: "xmark.circle.fill")!, title: "\(data?.message ?? "Invalid Details")")
                toast.show()
                //                self.activityLoader.hidesWhenStopped = true
                print("error is error")
                self.activityLoader.stopAnimating()
                
            }
        }
    }
    
    
    
    func DidReceiveError(error: String) {
        DispatchQueue.main.async{
            //            let toast = Toast.text("Network")
            //            toast.show()
            print("Network")
            self.activityLoader.hidesWhenStopped = true
            self.activityLoader.stopAnimating()
        }
    }
    
    
    
   
    let loginViewModel = LoginViewModel()
    
    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginSubLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var passwordImage: UIImageView!
    @IBOutlet weak var createAccLabel: UILabel!
    
    var keyboardHandler: KeyboardHandler?
    let activityLoader = UIActivityIndicatorView(style: .large)
    var emailFromOTP: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.text = emailFromOTP
        emailTF.text = KeychainWrapper.getEmail(forAccount: "userEmail")
        navigationItem.hidesBackButton = true
        view.addSubview(activityLoader)
        activityLoader.hidesWhenStopped = true
        activityLoader.center = view.center
        
        setupKeyboardDismissRecognizer()
        
        emailTF.delegate = self
        passwordTF.delegate = self
        keyboardHandler = KeyboardHandler(containerView: view) { keyboardHeight in
            // Add your conditions for whether to adjust the view based on keyboard height
            return UIScreen.main.bounds.height <= 900 && keyboardHeight >= 200
        }
        
        
        loginViewModel.delegate = self
        propertiesAssignment()
        
        
        let createAcc = UITapGestureRecognizer(target: self, action: #selector(createLabel))
        createAccLabel.isUserInteractionEnabled = true
        createAccLabel.addGestureRecognizer(createAcc)
        
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(togglePassword))
        passwordImage.isUserInteractionEnabled = true
        passwordImage.addGestureRecognizer(imageTapped)
        
        let reset = UITapGestureRecognizer(target: self, action: #selector(resetPassLabel))
        forgotPasswordLabel.isUserInteractionEnabled = true
        forgotPasswordLabel.addGestureRecognizer(reset)
    }
    
    @objc func togglePassword(){
        // Toggle the secure text entry property of the password text field
        passwordTF.isSecureTextEntry.toggle()
        // Update the eye image based on the current state of the password visibility
        updateEyeImageView()
    }
    
    func updateEyeImageView() {
        // Update the eye image based on the current state of the password visibility
        let imageState = passwordTF.isSecureTextEntry ? "eye" : "openeye"
        passwordImage.image = UIImage(named: imageState)
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        Task {
            let email = emailTF.text
            let password = passwordTF.text
            
            if (email?.isEmpty ?? true || password?.isEmpty ?? true) {
                print("a field is empty")
                let config = ToastConfiguration(
                    direction: .top,
                    dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
                    animationTime: 0.2
                )
                let toast = Toast.default(
                    image: UIImage(systemName: "xmark.circle.fill")!, title: "A field is empty")
                toast.show()
                self.activityLoader.stopAnimating()
            }else{
                await loginViewModel.login(emailInput: email ?? "", passwordInput: password ?? "")
            }
            
            //            let home = TabViewController()
            //            navigationController?.pushViewController(home, animated: true)
        }
        activityLoader.startAnimating()
    }
    
    @objc func createLabel() {
        let signUp = SignUpViewController()
        navigationController?.pushViewController(signUp, animated: true)
    }
    
    @objc func resetPassLabel(){
        let resetPage = ResetPasswordViewController()
        navigationController?.pushViewController(resetPage, animated: true)
    }
    
    
    func propertiesAssignment(){
        
        appLogo.image = UIImage(named: "raiser")
        loginLabel.text = "Login"
        loginLabel.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        loginLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        loginSubLabel.text = "Take control of your financial future Today!"
        loginSubLabel.font = .systemFont(ofSize: 14, weight: .light)
        
      
        
        emailTF.placeholder = "Enter your email address"
        passwordTF.placeholder = "Enter your password"
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.layer.backgroundColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1).cgColor

        
        
        forgotPasswordLabel.text = "Forget/Reset your password?"
        forgotPasswordLabel.textColor = UIColor(red: 0.304, green: 0.298, blue: 0.298, alpha: 1)
        forgotPasswordLabel.font = UIFont(name: "Lato-Regular", size: 5)
        
        createAccLabel.text = "Create an account"
        createAccLabel.textColor = UIColor(red: 0.604, green: 0.051, blue: 0.243, alpha: 1)
        createAccLabel.font = UIFont(name: "Lato-SemiBold", size: 14)
        
        passwordImage.image = UIImage(named: "eye")
        
    }
}
