//
//  AppService.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation
class AppService: AppServiceProtocol {
    
    static let shared = AppService()
    
    private init() {}
    
    func isProduction() -> Bool {
        return !isStaging()
    }
    
    func isStaging() -> Bool {
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
           let myDict = NSDictionary(contentsOfFile: path!)
           return myDict?.value(forKey: "targetName") as! String? == "testing"
       }
}
