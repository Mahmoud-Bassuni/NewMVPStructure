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
    var coordinator: MainCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        // send that into our coordinator so that it can display view controllers
        coordinator = MainCoordinator(navigationController: navController)
        // tell the coordinator to take over control
        coordinator?.start()

        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        
        return true
    }
    
}

