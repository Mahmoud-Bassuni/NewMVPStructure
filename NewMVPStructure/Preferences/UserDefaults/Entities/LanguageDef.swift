//
//  LanguageDef.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

class LanguageDef {
    private let languageKey = "AppleLanguages"
    private let languageSetKey = "isLanguageIsSet"
    
    func set(language: LangaugeEnum) {
        UserDefaults.standard.set(true, forKey: languageSetKey)
        UserDefaults.standard.set(language, forKey: languageKey)
        UserDefaults.standard.synchronize()
    }
    
    func get() -> String {
        return "lang_key".localized
    }
    
    func isArabic() -> Bool {
        return get() == "ar"
    }
    
    func isEnglish() -> Bool {
        return get() == "en"
    }
    
    func isSet() -> Bool {
        return UserDefaults.standard.bool(forKey: languageSetKey)
    }
    
     func currentLanguage() -> String{
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: "AppleLanguages") as! NSArray
        let current = langArray.firstObject as! String
        return current
    }
    
     func currentLanguageId() -> Int{
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: "AppleLanguages") as! NSArray
        let current = langArray.firstObject as! String
        return current == "ar" ? 2 : 1
    }
    
}
