//
//  Extension+UIViewController.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import UIKit
import SwiftMessages
import SVProgressHUD
extension UIViewController {
    
    func isArabic() -> Bool {
        return NSLocalizedString("lang_key", comment: "") == "ar"
    }
    
    func showAlertMessage(layout: MessageView.Layout, type: Theme, message: String, _ retryBlock: (() -> Void)?) {
        SwiftMessages.hideAll()
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal.rawValue)
        config.duration = .seconds(seconds: 5) //10
        config.dimMode = .none // .gray(interactive: true)
        config.interactiveHide = true
        config.preferredStatusBarStyle = .lightContent

        let view = MessageView.viewFromNib(layout: layout)
        view.configureTheme(backgroundColor: UIColor(named: "\(type)")!, foregroundColor: UIColor.white, iconImage: IconStyle.subtle.image(theme: type))
        view.configureContent(title: message.localized, body: "")
        view.titleLabel?.numberOfLines = 0
        view.bodyLabel?.numberOfLines = 0
        view.bodyLabel?.removeFromSuperview()
        if retryBlock != nil {
            view.button?.setTitleForAllStates(NSLocalizedString("retry", comment: ""))
            view.button?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            view.buttonTapHandler = { _ in
                SwiftMessages.hide()
                retryBlock!()
            }
        } else {
            view.button?.removeFromSuperview()
        }
        SwiftMessages.show(config: config, view: view)
    }
    
    func vibrateView(feedback: UINotificationFeedbackGenerator.FeedbackType) {
         let generator = UINotificationFeedbackGenerator()
         generator.notificationOccurred(feedback)
     }

     func vibrateView(style: UIImpactFeedbackGenerator.FeedbackStyle) {
         let generator = UIImpactFeedbackGenerator(style: style)
         generator.impactOccurred()
     }

     func vibrateView() {
         let generator = UISelectionFeedbackGenerator()
         generator.selectionChanged()
     }

     func showMessage(type: Theme, message: String, _ retryBlock: (() -> Void)?) {
         self.showAlertMessage(layout: MessageView.Layout.cardView, type: type, message: message, retryBlock)
     }

   

     func reloadView() {
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

     func switchRootVC(viewController: UIViewController, dismiss: Bool) {
         if dismiss { UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: false, completion: nil)
         }
         UIApplication.shared.windows.first?.switchRootViewController(to: viewController, animated: true, duration: 0.3, options: .transitionCrossDissolve, nil)
     }
     
     func dismissKeyboard() {
         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.DismissKeyboard))
         tap.cancelsTouchesInView = false
         self.view.addGestureRecognizer(tap)
     }
    
     func showLoader()
     {
         SVProgressHUD.show(withStatus: "")
     }
     
     func hideLoader()
     {
        SVProgressHUD.dismiss()
     }
     
     @objc func DismissKeyboard() {
         view.endEditing(true)
     }
}
