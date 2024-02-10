//
//  LoginPageViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 05/02/2024.
//

import UIKit
import Toast

class LoginPageViewController: UIViewController, LoginModelDelegate, UITextFieldDelegate {
    func DidReceivedResponse(data: LoginResponseModel?) {
        
        DispatchQueue.main.async{
            
            if let token = data?.token{
                self.activityLoader.stopAnimating()
                let config = ToastConfiguration(
                    direction: .top,
                    dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
                    animationTime: 0.2
                )
                let toast = Toast.default(
                    image: UIImage(systemName: "checkmark.shield.fill")!, title: "Login Successful")
                toast.show()
                let onboarding = OnboardingViewController()
                self.navigationController?.pushViewController(onboarding, animated: true)
                print("Login Success message:", token)
            }else{
                print("error is error")
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
    
    
    var btn = ButtonColor()
    var lbl = LabelsColor()
    let loginViewModel = LoginViewModel()
    
    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginSubLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var passwordImage: UIImageView!
    @IBOutlet weak var createAccLabel: UILabel!
    @IBOutlet var viewContainers: [UIView]!
    var keyboardHandler: KeyboardHandler?
    let activityLoader = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        view.addSubview(activityLoader)
        activityLoader.hidesWhenStopped = true
        activityLoader.center = view.center
        
        setupKeyboardDismissRecognizer()
        
        emailTF.delegate = self
        passwordTF.delegate = self
        keyboardHandler = KeyboardHandler(containerView: view) { keyboardHeight in
            // Add your conditions for whether to adjust the view based on keyboard height
            return UIScreen.main.bounds.height <= 800 && keyboardHeight >= 200
        }


        loginViewModel.delegate = self
        propertiesAssignment()
        btn.colorConfiguration(button: loginButton)
                
        
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
            }else{
                await loginViewModel.login(emailInput: email ?? "", passwordInput: password ?? "")
                activityLoader.startAnimating()
            }
//            let home = TabViewController()
//            navigationController?.pushViewController(home, animated: true)
        }
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
        loginLabel.text = "Login"
        loginLabel.font = .systemFont(ofSize: 35, weight: .bold)
        loginLabel.textColor = UIColor(red: 0.196, green: 0.055, blue: 0.114, alpha: 1)
        //lbl.colorConfiguration(label: loginLabel)
        
        
        loginSubLabel.text = "Take control of your financial future Today!"
        
        
        loginSubLabel.textColor = UIColor(red: 0.565, green: 0.039, blue: 0.224, alpha: 1)
        loginSubLabel.font = UIFont(name: "Lato-Regular", size: 14)
        
        emailLabel.text = "Email"
        emailLabel.textColor = .white
        emailLabel.font = .systemFont(ofSize: 16)
        
        emailTF.placeholder = "Enter your email address"
        
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        passwordLabel.font = .systemFont(ofSize: 16)
        passwordTF.placeholder = "Enter your password"
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 8
        
        
        forgotPasswordLabel.text = "Forget/Reset your password?"
        forgotPasswordLabel.textColor = UIColor(red: 0.304, green: 0.298, blue: 0.298, alpha: 1)
        forgotPasswordLabel.font = UIFont(name: "Lato-Regular", size: 5)
        
        createAccLabel.text = "Create an account"
        createAccLabel.textColor = UIColor(red: 0.604, green: 0.051, blue: 0.243, alpha: 1)
        createAccLabel.font = UIFont(name: "Lato-SemiBold", size: 14)
        
        passwordImage.image = UIImage(named: "eye")
        
        viewContainersLabel()
    }
    
    func viewContainersLabel(){
        for viewLabel in viewContainers{
            var views = ViewColor()
            
            views.colorConfiguration(viewContainers: viewLabel)
        }
    }
}
