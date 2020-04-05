//
//  DeviceServiceProtocol.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

protocol DeviceServiceProtocol {

    func isNotificationsEnabled(onEnabled: @escaping (() -> Void), onDisabled: @escaping (() -> Void))
    
    func setLanguage(language: LangaugeEnum)
    
    func logout()
    
}
