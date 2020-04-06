//
//  MainCoordinator.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/6/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = RepositoryViewController.init()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func RepositoryDetails() {
        let vc = RepositoryDetailsViewController.init()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
}
