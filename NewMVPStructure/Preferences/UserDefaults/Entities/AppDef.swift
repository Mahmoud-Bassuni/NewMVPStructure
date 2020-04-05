//
//  AppDef.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//
import Foundation
class AppDef {

    private let boardingKey = "onBoardingHasBeenSeen"
    private let showBalanceKey = "ShowBalanceKey"

    // if the app has seen the onboarding
    func borded() -> Bool {
        UserDefaults.standard.register(defaults: [boardingKey: false])
        return UserDefaults.standard.bool(forKey: boardingKey)
    }

    func setBorded(borded: Bool) {
        UserDefaults.standard.set(borded, forKey: boardingKey)
    }
    
    func isShowBalance() -> Bool {
        UserDefaults.standard.register(defaults: [showBalanceKey: true])
        return UserDefaults.standard.bool(forKey: showBalanceKey)
    }

    func setShowBalance(showBalance : Bool) {
        UserDefaults.standard.set(showBalance, forKey: showBalanceKey)
    }
}

