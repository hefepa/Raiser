//
//  SignUpViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 05/02/2024.
//

import UIKit
import SwiftUI
import Toast

class SignUpViewController: UIViewController, RegistrationModelDelegate, UITextFieldDelegate {
//    weak var delegate: EmailInputDelegate?

    
    func DidReceiveError(error: String) {
            print("erroroooooooo")
        }
    
    func DidReceivedResponse(data: RegistrationResponseModel?) {
        DispatchQueue.main.async{
            
            if data?.success == true{
                self.activityLoader.stopAnimating()
                self.savingUserDetails()
                let config = ToastConfiguration(
                    direction: .top,
                    dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
                    animationTime: 0.2
                )
                
                if let response = data?.message{
                    let toast = Toast.default(
                        image: UIImage(systemName: "checkmark.shield.fill")!, title: response)
                    toast.show()
                }
//                self.storesUserName()
                let otpView = OTPViewController()
                
                otpView.expectedText = self.emailTF.text
                self.navigationController?.pushViewController(otpView, animated: true)
                
//                if let text = self.emailTF.text {
//                    self.delegate?.didEnterText(text)
                }else{
                    self.activityLoader.stopAnimating()

                    print("My response data is \(data?.message)")
                    if let erroResponse = data?.message{
                        let toast = Toast.default(
                            image: UIImage(systemName: "exclamationmark.circle.fill")!, title: erroResponse)
                        toast.show()
                    }
                }
            }
        }
    
    func savingUserDetails(){
        if let password = passwordTF.text, let email = emailTF.text{
            KeychainWrapper.saveEmail(email, forAccount: "userEmail")
            KeychainWrapper.savePassword(password, forAccount: "userPassword")
        }
    }
        
        func storesUserName() {
            // Retrieve email input from the text field
            guard let emailInput = emailTF.text, !emailInput.isEmpty else {
                // Handle the case where the email input is nil or empty
                return
            }

            // Check if there is no value stored in UserDefaults under the key "EmailAddress"
            if UserDefaults.standard.string(forKey: "EmailAddress") == nil {
                // Save the email input to UserDefaults under the key "EmailAddress"
                UserDefaults.standard.setValue(emailInput, forKey: "EmailAddress")
            }

            // Create an instance of LoginPageViewController
            let otpPage = OTPViewController()

            // Set the email text field in the LoginPageViewController instance
            if let storedEmail = UserDefaults.standard.string(forKey: "EmailAddress") {
                otpPage.userEmailLabel.text = storedEmail as? String
            } else {
                otpPage.userEmailLabel.text = ""
            }
        }

    

    
    var registerViewModel = RegistrationViewModel()

    
    var btn = ButtonColor()
    var labelsView = ViewColor()
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var subSignUpLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var termsCheckBox: UIButton!
    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var haveAccountLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet var container: [UIView]!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var phoneNumberCaution: UILabel!
    @IBOutlet weak var passwordHideImage: UIImageView!
    @IBOutlet weak var confirmPasswordHideImage: UIImageView!
    let activityLoader = UIActivityIndicatorView(style: .large)

    
    
    var termsAndConditionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityLoader)
        activityLoader.hidesWhenStopped = true
        activityLoader.center = view.center
        
        
        //passwordTF.delegate = self
        phoneNumberTF.delegate = self
        
        passwordTF.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)


        navigationItem.hidesBackButton = true
        setupKeyboardDismissRecognizer()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        propertiesAssignment()
        btn.colorConfiguration(button: signUpButton)
        
        termsCheckBox.setImage(UIImage(systemName: "square")?.withRenderingMode(.alwaysTemplate), for: .normal)
        termsCheckBox.setImage(UIImage(named: "tick")?.withRenderingMode(.alwaysTemplate), for: .selected)
        
        registerViewModel.delegate = self
        
        let loginPage = UITapGestureRecognizer(target: self, action: #selector(LoginLabelClicked))
        loginLabel.isUserInteractionEnabled = true
        loginLabel.addGestureRecognizer(loginPage)
        
        
        let passwordImageClicked = UITapGestureRecognizer(target: self, action: #selector(togglePassword))
        passwordHideImage.isUserInteractionEnabled = true
        passwordHideImage.addGestureRecognizer(passwordImageClicked)
        
        let confirmPasswordImageClicked = UITapGestureRecognizer(target: self, action: #selector(toggleConfirmPassword))
        confirmPasswordHideImage.isUserInteractionEnabled = true
        confirmPasswordHideImage.addGestureRecognizer(confirmPasswordImageClicked)
    }
    
    @objc func passwordChanged() {
            if let password = passwordTF.text {
                if isStrongPassword(password) {
                    validationLabel.text = "Valid password"
                    validationLabel.textColor = .green
                } else {
                    validationLabel.text = "Password must have at least one uppercase letter, one digit, one special character, and be at least 8 characters long."
                    validationLabel.textColor = .red
                }
            }
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }

    
    @objc func LoginLabelClicked(){
        let loginPage = LoginPageViewController()
        navigationController?.pushViewController(loginPage, animated: true)
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        let otpPage = OTPViewController()
        
        
        if ((firstNameTF.text?.isEmpty ?? true) ||
            (lastNameTF.text?.isEmpty ?? true) ||
            (emailTF.text?.isEmpty ?? true) ||
            (phoneNumberTF.text?.isEmpty ?? true) ||
            (passwordTF.text?.isEmpty ?? true) ||
            (confirmPasswordTF.text?.isEmpty ?? true) || !termsCheckBox.isSelected) {
            let toast = Toast.text("A field is empty")
            toast.show()
            print("a field is empty")
        }else if (phoneNumberTF.text?.count ?? 0 < 11){
            phoneNumberCaution.textColor = .red
            phoneNumberCaution.font = .systemFont(ofSize: 12)
            phoneNumberCaution.text = "Kindly enter 11 digits"
            print ("Number not to 11 digits")
        }else {
            phoneNumberCaution.text = ""
            
            Task {
                
                activityLoader.startAnimating()
                await registerViewModel.registerUser(firstNameInput: firstNameTF.text ?? "", lastNameInput: lastNameTF.text ?? "", emailInput: emailTF.text ?? "", phoneNumberInput: phoneNumberTF.text ?? "", passwordInput: passwordTF.text ?? "", confirmPasswordInput: confirmPasswordTF.text ?? "")
//                emailTF.text ?? "\(otpPage.text = emailTF.text)"
                savingUserDetails()
            }
        }
    }
    
    func isStrongPassword(_ password: String) -> Bool {
            let passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[^A-Za-z0-9]).{8,}$"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            return passwordPredicate.evaluate(with: password)
        }
    

    @IBAction func termsChecked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.count ?? 0) + string.count - range.length
               return newLength <= 11
    }

    @objc func togglePassword(){
        // Toggle the secure text entry property of the password text field
        passwordTF.isSecureTextEntry.toggle()
//        confirmPasswordTF.isSecureTextEntry.toggle()
        // Update the eye image based on the current state of the password visibility
        updateEyeImageView()
    }
    
    func updateEyeImageView() {
        // Update the eye image based on the current state of the password visibility
        let imageState = passwordTF.isSecureTextEntry ? "eye" : "openeye"
//        let imageStateConfirmPassword = confirmPasswordTF.isSecureTextEntry ? "eye" : "openeye"
        passwordHideImage.image = UIImage(named: imageState)
//        confirmPasswordHideImage.image = UIImage(named: imageStateConfirmPassword)
        }
    
    
    @objc func toggleConfirmPassword(){
        // Toggle the secure text entry property of the password text field
        confirmPasswordTF.isSecureTextEntry.toggle()
        // Update the eye image based on the current state of the password visibility
        updateEyeConfirmPasswordImageView()
    }
    
    func updateEyeConfirmPasswordImageView() {
        let imageStateConfirmPassword = confirmPasswordTF.isSecureTextEntry ? "eye" : "openeye"
        confirmPasswordHideImage.image = UIImage(named: imageStateConfirmPassword)
        }

    func propertiesAssignment(){
        signUpLabel.text = "Sign Up"
        signUpLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        subSignUpLabel.text = "Start your investment journey with ease."
        subSignUpLabel.font = .systemFont(ofSize: 14, weight: .light)
        subSignUpLabel.textColor = .black
        
        
        
        firstNameLabel.text = "First Name"
        firstNameLabel.textColor = .white
        firstNameLabel.font = .systemFont(ofSize: 12)
        
        firstNameTF.placeholder = "Enter your first name"
        
        lastNameLabel.text = "Last Name"
        lastNameLabel.textColor = .white
        lastNameLabel.font = .systemFont(ofSize: 12)
        
        lastNameTF.placeholder = "Enter your last name"
        
        
        emailLabel.text = "Email"
        emailLabel.textColor = .white
        emailLabel.font = .systemFont(ofSize: 12)
        
        emailTF.placeholder = "Enter your email address"
        
        phoneNumberLabel.text = "Phone Number"
        phoneNumberLabel.textColor = .white
        phoneNumberLabel.font = .systemFont(ofSize: 12)
        
        phoneNumberTF.placeholder = "Enter your mobile number"
        
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        passwordLabel.font = .systemFont(ofSize: 12)
        
        passwordTF.placeholder = "Enter your password"
        passwordHideImage.image = UIImage(named: "eye")
        
        confirmPasswordLabel.text = "Confirm Password"
        confirmPasswordLabel.textColor = .white
        confirmPasswordLabel.font = .systemFont(ofSize: 12)
        
        confirmPasswordTF.placeholder = "Confirm your password"
        confirmPasswordHideImage.image = UIImage(named: "eye")

        termsCheckBox.layer.borderWidth = 2.0
        termsCheckBox.layer.borderColor = UIColor(red: 0.604, green: 0.051, blue: 0.243, alpha: 0.5).cgColor
        termsLabel.text = "I hereby agree to the terms and privacy policy of Raise"
        termsLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.titleLabel?.textColor = UIColor(red: 0.604, green: 0.051, blue: 0.243, alpha: 1)
        
        cancelButton.tintColor = UIColor(red: 0.904, green: 0.051, blue: 0.243, alpha: 0.5)
        cancelButton.layer.borderColor = UIColor(red: 0.604, green: 0.051, blue: 0.243, alpha: 0.5).cgColor
        cancelButton.layer.borderWidth = 2.0
        cancelButton.layer.cornerRadius = 8
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.tintColor = .white
        signUpButton.titleLabel?.textColor = .white
        signUpButton.layer.cornerRadius = 8
        
        haveAccountLabel.text = "Do you have already existing account?"
        haveAccountLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        loginLabel.text = "Login"
        loginLabel.font = .systemFont(ofSize: 12)
        
        colorLabels()
    }
    
    func colorLabels(){
        for viewLabel in container{
            labelsView.colorConfiguration(viewContainers: viewLabel)
        }
    }
}
