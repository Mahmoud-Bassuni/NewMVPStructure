//
//  DateService.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation
class DateService: DateServiceProtocol {
    static let shared = DateService()
    
    private init() {}
    
    func dateToString(date: Date, format: DateFormatEnum) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: AppDefaults.shared.langauge().currentLanguage())
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: date).arabicToEnglish
    }
    
    func stringToDate(string: String, format: DateFormatEnum) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: AppDefaults.shared.langauge().currentLanguage())
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: string)
    }
}
