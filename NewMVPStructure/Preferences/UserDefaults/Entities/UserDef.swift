//
//  UserDef.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

class UserDef {
    private let loggedInKey = "isloggedIn4"

    func isLoggedIn() -> Bool {
        UserDefaults.standard.register(defaults: [loggedInKey: false])
        return UserDefaults.standard.bool(forKey: loggedInKey)
    }

    func setLoggedIn(loggedIn: Bool) {
        UserDefaults.standard.set(loggedIn, forKey: loggedInKey)
    }
}
