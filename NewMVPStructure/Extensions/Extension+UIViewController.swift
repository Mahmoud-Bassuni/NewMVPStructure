//
//  Extension+UIViewController.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import UIKit
import SwiftMessages
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
}
