//
//  Extension+Dictionary.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

public extension Dictionary {

    func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    
    func query() -> String {
       var output: String = ""
       for (key,value) in self {
           output +=  "\(key)=\(value)&"
       }
       output = String(output.dropLast())
       return output
    }
}
