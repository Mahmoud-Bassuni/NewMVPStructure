//
//  Coordinator.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/6/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    
    func start()
    
}

