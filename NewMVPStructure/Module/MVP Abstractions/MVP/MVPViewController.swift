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
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(feedback)
    }

    func vibrate(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }

    func vibrate() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }

    func showAlertMessage(type: Theme, message: String, _ retryBlock: (() -> Void)?) {
        self.showAlertMessage(layout: MessageView.Layout.cardView, type: type, message: message, retryBlock)
    }

    func showTopAlertMessage(type: Theme, message: String, _ retryBlock: (() -> Void)?) {
        self.showAlertMessage(layout: MessageView.Layout.tabView, type: type, message: message, retryBlock)
    }

    func reloadLanguage() {
        UIView.appearance().semanticContentAttribute = self.isArabic() ? .forceRightToLeft : .forceLeftToRight
        UILabel.appearance().semanticContentAttribute = self.isArabic() ? .forceRightToLeft : .forceLeftToRight
        UIButton.appearance().semanticContentAttribute = self.isArabic() ? .forceRightToLeft : .forceLeftToRight
        UINavigationBar.appearance().semanticContentAttribute = self.isArabic() ? .forceRightToLeft : .forceLeftToRight
        UIStackView.appearance().semanticContentAttribute = self.isArabic() ? .forceRightToLeft : .forceLeftToRight
        UISearchBar.appearance().semanticContentAttribute = self.isArabic() ? .forceRightToLeft : .forceLeftToRight
        UITabBar.appearance().semanticContentAttribute = self.isArabic() ? .forceRightToLeft : .forceLeftToRight
        UICollectionView.appearance().semanticContentAttribute = self.isArabic() ? .forceRightToLeft : .forceLeftToRight
        UISwitch.appearance().semanticContentAttribute = self.isArabic() ? .forceRightToLeft : .forceLeftToRight
    }

    func switchRoot(viewController: UIViewController, dismiss: Bool) {
        if dismiss { UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: false, completion: nil)
        }
        UIApplication.shared.windows.first?.switchRootViewController(to: viewController, animated: true, duration: 0.3, options: .transitionCrossDissolve, nil)
    }
    
    func dismissKeyboardWhenTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
   
    func showLoading()
    {
        SVProgressHUD.show(withStatus: "")
    }
    
    func hideLoading()
    {
       SVProgressHUD.dismiss()
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
