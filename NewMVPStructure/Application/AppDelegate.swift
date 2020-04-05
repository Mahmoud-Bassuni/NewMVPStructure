//
//  AppDelegate.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window!.rootViewController =  UINavigationController(rootViewController: RepositoryViewController.init())
            self.window!.makeKeyAndVisible()
            return true
    }
    
}

