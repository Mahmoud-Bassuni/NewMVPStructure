//
//  AppDefaults.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//
import Foundation
class AppDefaults {

    static let shared = AppDefaults()

    private init(){
    }

    func app() -> AppDef {
        return AppDef()
    }

    func user() -> UserDef {
        return UserDef()
    }

    func langauge() -> LanguageDef {
        return LanguageDef()
    }

    func clear() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}
