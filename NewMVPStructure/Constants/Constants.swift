//
//  File.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//
import UIKit
enum ColorCompatibility {
    static var systemBackground: UIColor {
        if #available(iOS 13, *) {
            return .systemBackground
        }
        return UIColor.white
    }
}

enum LangaugeEnum: String {
    case arabic = "ar"
    case english = "en"
}

enum SystemFontWeightEnum: Any {
    case light
    case regular
    case medium
    case bold
}

enum DateFormatEnum: String {
    case dateAndTime = "yyyy-MM-dd hh:mm a"
    case date = "yyyy-MM-dd"
    case time12 = "hh:mm aa"
    case time24 = "HH:mm"
    case eventsDateFormat = "yyyyMMddd"
    case dateWithMonthName = "dd MMM yyyy"
}
