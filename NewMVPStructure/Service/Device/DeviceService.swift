//
//  DeviceService.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation
import UIKit
class DeviceService : DeviceServiceProtocol {
    
    static let shared = DeviceService()

    private init(){
    }

    func isNotificationsEnabled(onEnabled: @escaping (() -> Void), onDisabled: @escaping (() -> Void)) {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (settings) in
            switch settings.authorizationStatus{
            case .authorized:
                DispatchQueue.main.async { // allowed
                    onEnabled()
                }
                break
            default:
                DispatchQueue.main.async {
                    onDisabled()
                }
                break
            }
        }
    }

    func setLanguage(language: LangaugeEnum) {
        Bundle.setLanguage(language.rawValue)
    }
    
    func logout() {
        DispatchQueue.main.async {
            UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: false, completion: nil)
            //let vc = Stories.authentication.mobileNumber
            UIApplication.shared.windows.first?.switchRootViewController(to: RepositoryViewController(), animated: true, duration: 0.2, options: .curveEaseOut, {
            
            })
        }
    }
}
