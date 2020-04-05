//
//  BaseViewController.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//
import UIKit
import SwiftMessages
class BaseViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    func design(_ dp : DesignerProtocol) {
        dp.renderUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ConnectionManger.shared.isConnectionUnreachable {
            self.showAlertMessage(layout: MessageView.Layout.cardView, type: .warning, message: "no connection",nil)
            return
        }
    }
}
