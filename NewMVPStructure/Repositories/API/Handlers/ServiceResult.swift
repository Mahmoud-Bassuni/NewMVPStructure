//
//  ServiceResult.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 4/1/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

enum Result<T> {
    
    case success(T)
    case failure(ApiError)
    
}

