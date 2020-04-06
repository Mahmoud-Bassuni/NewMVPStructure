//
//  MVPViewController.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import SwiftMessages
import SVProgressHUD

class MVPViewController: BaseViewController, MVPViewProtocol {
    
    func vibrate(feedback: UINotificationFeedbackGenerator.FeedbackType) {
        self.vibrateView(feedback :feedback)
    }
    
    func vibrate(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        self.vibrateView(style :style)
    }
    
    func vibrate() {
        self.vibrateView()
    }
    
    func showAlertMessage(type: Theme, message: String, _ retryBlock: (() -> Void)?) {
        self.showMessage(type: type, message: message, retryBlock)
    }
    
    func reloadLanguage() {
        self.reloadView()
    }
    
    func switchRoot(viewController: UIViewController, dismiss: Bool) {
        self.switchRootVC(viewController: viewController, dismiss: dismiss)
    }
    
    func dismissKeyboardWhenTap() {
        self.dismissKeyboard()
    }
    
    func showLoading()
    {
        self.showLoader()
    }
    
    func hideLoading()
    {
        self.hideLoader()
    }
    
    func hideKeyboard() {
        self.dismissKeyboard()
    }
    
}
