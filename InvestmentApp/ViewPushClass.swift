////
////  ViewPushClass.swift
////  InvestmentApp
////
////  Created by WEMA on 09/02/2024.
////
//
//import Foundation
//import UIKit
//
//class KeyboardHandler {
//    private var containerView: UIView?
//
//    init(containerView: UIView) {
//        self.containerView = containerView
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShow(_:)),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillHide(_:)),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil
//        )
//    }
//
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//
//    @objc private func keyboardWillShow(_ notification: Notification) {
//        guard let containerView = containerView,
//              let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//        else {
//            return
//        }
//
//        containerView.frame.origin.y = UIScreen.main.bounds.height - keyboardSize.height - containerView.frame.height
//    }
//
//    @objc private func keyboardWillHide(_ notification: Notification) {
//        guard let containerView = containerView else {
//            return
//        }
//
//        containerView.frame.origin.y = 0
//    }
//}

//import UIKit
//
//class KeyboardHandler {
//    private weak var containerView: UIView?
//    private let minHeightThreshold: CGFloat = 200 // Adjust this threshold as needed
//
//    init(containerView: UIView) {
//        self.containerView = containerView
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShow(_:)),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillHide(_:)),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil
//        )
//    }
//
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//
//    @objc private func keyboardWillShow(_ notification: Notification) {
//        guard let containerView = containerView,
//              let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//        else {
//            return
//        }
//
//        let screenHeight = UIScreen.main.bounds.height
//        let containerViewHeight = containerView.frame.height
//
//        // Check if there's enough space for the view before adjusting the frame
//        if screenHeight - keyboardSize.height - containerViewHeight >= minHeightThreshold {
//            containerView.frame.origin.y = screenHeight - keyboardSize.height - containerViewHeight
//        }
//    }
//
//    @objc private func keyboardWillHide(_ notification: Notification) {
//        guard let containerView = containerView else {
//            return
//        }
//
//        containerView.frame.origin.y = 0
//    }
//}

import UIKit

class KeyboardHandler {
    private weak var containerView: UIView?
    private var shouldAdjustClosure: ((CGFloat) -> Bool)?
    
    init(containerView: UIView, shouldAdjustClosure: ((CGFloat) -> Bool)? = nil) {
        self.containerView = containerView
        self.shouldAdjustClosure = shouldAdjustClosure

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let containerView = containerView,
              let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            return
        }

        // Check if the closure allows adjustment based on the keyboard height
        if shouldAdjustClosure?(keyboardSize.height) ?? true {
            containerView.frame.origin.y = UIScreen.main.bounds.height - keyboardSize.height - containerView.frame.height
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let containerView = containerView else {
            return
        }

        containerView.frame.origin.y = 0
    }
}
