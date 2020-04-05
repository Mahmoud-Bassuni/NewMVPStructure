//
//  MVPProtocol.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import SwiftMessages

protocol MVPViewProtocol{ // from the presenter to view
    
    func showTopAlertMessage(type: Theme, message: String, _ retryBlock:(() -> Void)?)

    func showAlertMessage(type: Theme, message: String, _ retryBlock:(() -> Void)?)

    func vibrate(feedback: UINotificationFeedbackGenerator.FeedbackType)

    func vibrate(style: UIImpactFeedbackGenerator.FeedbackStyle)

    func vibrate() // for selection
    
    func reloadLanguage()

    func switchRoot(viewController: UIViewController, dismiss: Bool)

    func dismissKeyboardWhenTap()

    func hideKeyboard()
    
    func showLoading()
    
    func hideLoading()
}

protocol MVPPresenterProtocol{ // from the view to the presenter
    func viewStarted()
    
}
