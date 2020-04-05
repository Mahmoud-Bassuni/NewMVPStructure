//
//  ButtonUtilities.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation
import UIKit
class ButtonUtilities {
    static let shared = ButtonUtilities()
    
    private init(){}
    
    func blueButton(buttons: UIButton...){
        for button in buttons {
            button.setTitleColorForAllStates(.white)
            button.layer.masksToBounds = false
            button.layer.shadowOpacity = 0.12
            button.layer.shadowOffset = CGSize.init(width: 0, height: 0)
            button.layer.shadowRadius = 2
            button.layer.cornerRadius = 5
        }
    }
    
    func redButton(buttons: UIButton...){
        for button in buttons {
            button.setTitleColorForAllStates(.white)
            button.layer.masksToBounds = false
            button.layer.shadowOpacity = 0.12
            button.layer.shadowOffset = CGSize.init(width: 0, height: 0)
            button.layer.shadowRadius = 2
            button.layer.cornerRadius = 5
        }
    }
    
    func clearRedButton(buttons: UIButton...){
        for button in buttons {
            button.backgroundColor = .clear
        }
    }
    
    func clearBlueButton(buttons: UIButton...){
        for button in buttons {
            button.backgroundColor = .clear
        }
    }
}
