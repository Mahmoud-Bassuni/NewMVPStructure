//
//  DateServiceProtocol.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation
protocol DateServiceProtocol {
    
    func dateToString(date: Date, format: DateFormatEnum) -> String
    
    func stringToDate(string: String, format: DateFormatEnum) -> Date?
    
}
