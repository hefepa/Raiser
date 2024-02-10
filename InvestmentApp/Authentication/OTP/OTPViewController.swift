//
//  OTPViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import UIKit
import Toast

protocol EmailInputDelegate: AnyObject {
    func didEnterText(_ text: String)
}

class OTPViewController: UIViewController, OTPModelDelegate {
    func DidReceiveError(error: String) {
        DispatchQueue.main.async{
            print("erorororororor")
        }
    }
    
    func DidReceivedResponse(data: OTPResponseModel?) {
        DispatchQueue.main.async{
            if (data?.success == true){
                self.activityLoader.stopAnimating()
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
                let loginPage = LoginPageViewController()
                self.navigationController?.pushViewController(loginPage, animated: true)
                print("Success message is \(data?.message)")
                
                }else{
                    let config = ToastConfiguration(
                        direction: .top,
                        dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
                        animationTime: 0.2
                    )
                    
                    if let erroResponse = data?.message{
                        let toast = Toast.default(
                            image: UIImage(systemName: "exclamationmark.circle.fill")!, title: erroResponse)
                        toast.show()
                        print("Verification response is \(data?.message)")
                    }
                }
            }
        }
    
    var btn = ButtonColor()
    var otpViewModel = OTPViewModel()

    @IBOutlet weak var OTPLabel: UILabel!
    @IBOutlet weak var OTPimage: UIImageView!
    @IBOutlet weak var enterOTPLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet var OTPTFs: [UITextField]!
    @IBOutlet weak var notReceivedOTP: UILabel!
    @IBOutlet weak var resendOTPLabel: UILabel!
    @IBOutlet weak var verifyBtn: UIButton!
    let activityLoader = UIActivityIndicatorView(style: .large)


    override func viewDidLoad() {
        
        view.addSubview(activityLoader)
        activityLoader.hidesWhenStopped = true
        activityLoader.center = view.center
        
        super.viewDidLoad()
        setupKeyboardDismissRecognizer()
        propertiesAssignment()
        textFieldProperties()
        
        otpViewModel.delegate = self
        for OTPfields in OTPTFs{
            OTPfields.delegate = self
        }

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
            NotificationCenter.default.removeObserver(self)
        }
    
    @objc func keyboardWillShow(_ notification: Notification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                // Adjust the bottom constraint or frame of the container view based on the keyboard height
                view.frame.origin.y = view.frame.height - keyboardSize.height - view.frame.height
            }
        }

        @objc func keyboardWillHide(_ notification: Notification) {
            // Reset the container view's position when the keyboard is hidden
            view.frame.origin.y = 0
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // Dismiss the keyboard when the return key is pressed
            textField.resignFirstResponder()
            return true
        }
    
    
    @IBAction func verifyBtnClicked(_ sender: UIButton) {
        for otpFields in OTPTFs{
            otpFields.delegate = self
            if (otpFields.text?.isEmpty ?? true){
                print("A field is empty")
            }else{
                Task {
                    activityLoader.startAnimating()
                    let textFieldValues = OTPTFs.map { $0.text ?? "" }.joined()
                    await otpViewModel.verifyOTP(otps: textFieldValues)
                    print("The code entered is \(textFieldValues)")
                }
            }
        }
    }
    
    
    func textFieldProperties(){
        for textFields in OTPTFs{
            textFields.borderStyle = .none
            textFields.textAlignment = .center
            textFields.font = .systemFont(ofSize: 20)
            
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: textFields.frame.height - 7, width: textFields.frame.width, height: 2)
          
            bottomLine.backgroundColor = UIColor.black.cgColor
            textFields.layer.addSublayer(bottomLine)
            
            // Set a transparent background
            textFields.backgroundColor = UIColor.clear
            
            textFields.delegate = self
        }
    }
    
    func propertiesAssignment(){
        OTPimage.image = UIImage(named: "OTP")
        
        OTPLabel.text = "OTP Verification"
        OTPLabel.font = .systemFont(ofSize: 24, weight: .bold)
        OTPLabel.textAlignment = .center
        
        enterOTPLabel.text = "Enter the OTP sent to"
        enterOTPLabel.font = .systemFont(ofSize: 15, weight: .light)
        
        userEmailLabel.font = .systemFont(ofSize: 15, weight: .light)
        
        notReceivedOTP.text = "Didn't receive the OTP?"
        notReceivedOTP.font = .systemFont(ofSize: 15, weight: .light)
        
        resendOTPLabel.text = "Resend OTP"
        resendOTPLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        resendOTPLabel.textColor = UIColor(red: 0.227, green: 0.227, blue: 0.227, alpha: 1)
        
        verifyBtn.setTitle("Verify", for: .normal)
        verifyBtn.tintColor = .white
        btn.colorConfiguration(button: verifyBtn)
        
    }
}

extension OTPViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
//
//        // Change the text field's color based on whether it's empty or not
//        let bottomLine = CALayer()
//
//        if newText.isEmpty {
//            bottomLine.backgroundColor = UIColor.red.cgColor
//        } else {
//            bottomLine.backgroundColor = UIColor.green.cgColor
//        }
        // Allow the change to occur
        
        let maxLength = 1
        let currentText = textField.text ?? ""
        let newLength = currentText.count + string.count - range.length

        if newLength <= maxLength {
            textField.text = string

            // Move focus to the next text field
            if let currentIndex = OTPTFs.firstIndex(of: textField), currentIndex < OTPTFs.count - 1 {
                OTPTFs[currentIndex + 1].becomeFirstResponder()
            }

            return false
        } else {
            return false
        }
    }
}
