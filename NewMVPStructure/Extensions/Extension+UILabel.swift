//
//  UILabel.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func ultraLightFontWithSize(size: CGFloat){
        self.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .ultraLight) : UIFont.systemFont(ofSize: size, weight: .ultraLight)
    }
    func lightFontWithSize(size: CGFloat){
        self.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light) : UIFont.systemFont(ofSize: size, weight: .light)
    }
    func regularFontWithSize(size: CGFloat){
        self.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular) : UIFont.systemFont(ofSize: size, weight: .regular)
    }
    func mediumFontWithSize(size: CGFloat){
        self.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium) : UIFont.systemFont(ofSize: size, weight: .medium)
    }
    func semiBoldFontWithSize(size: CGFloat){
        self.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold) : UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    func boldFontWithSize(size: CGFloat){
        self.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold) : UIFont.systemFont(ofSize: size, weight: .bold)
    }
}
