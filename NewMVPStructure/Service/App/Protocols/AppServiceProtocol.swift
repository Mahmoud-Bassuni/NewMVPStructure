//
//  AppServiceProtocol.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

protocol AppServiceProtocol {
    
    func isProduction() -> Bool
    
    func isStaging() -> Bool
}
