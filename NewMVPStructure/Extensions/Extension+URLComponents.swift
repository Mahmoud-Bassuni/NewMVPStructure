//
//  Extension+URLComponents.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/28/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: Any]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value as? String ) }
    }
}
