//
//  Extension+String.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    public var arabicToEnglish: String {
           var sum = ""
           let letters = self.map { String($0) }
           let persianNumber = ["٠",
                                "١",
                                "٢",
                                "٣",
                                "٤",
                                "٥",
                                "٦",
                                "٧",
                                "٨",
                                "٩",
                                "،",
                                "٫"]
           for letter in letters {
               var isSuccess = false
               for (index, element) in persianNumber.enumerated() {
                   if letter == element {
                       if element == persianNumber[10] || element == persianNumber[11] {
                           sum = sum + "."
                           isSuccess = true
                       } else {
                           sum = sum + "\(index)"
                           isSuccess = true
                       }
                   }
               }
               if isSuccess != true {
                   sum = sum + letter
               }
           }
           return sum
       }
}
