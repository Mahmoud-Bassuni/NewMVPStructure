//
//  Extension+UIButton.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//
import UIKit
extension UIButton {
    
    private var states: [UIControl.State] {
        return [.normal, .selected, .highlighted, .disabled]
    }
    func setImageForAllStates(_ image: UIImage) {
        states.forEach { self.setImage(image, for: $0) }
    }
    func setTitleColorForAllStates(_ color: UIColor) {
        states.forEach { self.setTitleColor(color, for: $0) }
    }
    func setTitleForAllStates(_ title: String) {
        states.forEach { self.setTitle(title, for: $0) }
    }
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    
    func applyCornerRadius(){
        self.layer.cornerRadius = 6
    }
    
    func applyGreenButtonStyle(){
        self.setTitleColorForAllStates(.white)
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.12
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 6
    }
    
    func applyWhiteGreenButtonStyle(){
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.12
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 6
    }
    
    
    func applyWhiteBlueButtonStyle(){
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.12
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 6
    }
    
    func applyWhiteRedButtonStyle(){
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.12
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 6
    }
    
    func applyBlueButtonStyle(){
        self.setTitleColorForAllStates(.white)
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.12
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 6
    }
    
    func applyYesButtonStyle(){
        self.setTitleColorForAllStates(.white)
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.12
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 12
    }
    
    func applyNoButtonStyle(){
        self.setTitleColorForAllStates(.white)
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 12
    }
    
    func applyRedButtonStyle(){
        self.setTitleColorForAllStates(.white)
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.12
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 6
    }
        func ultraLightFontWithSize(size: CGFloat){
            self.titleLabel?.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .ultraLight) : UIFont.systemFont(ofSize: size, weight: .ultraLight)
        }
        func lightFontWithSize(size: CGFloat){
            self.titleLabel?.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light) : UIFont.systemFont(ofSize: size, weight: .light)
        }
        func regularFontWithSize(size: CGFloat){
            self.titleLabel?.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular) : UIFont.systemFont(ofSize: size, weight: .regular)
        }
        func mediumFontWithSize(size: CGFloat){
            self.titleLabel?.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium) : UIFont.systemFont(ofSize: size, weight: .medium)
        }
        func semiBoldFontWithSize(size: CGFloat){
            self.titleLabel?.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold) : UIFont.systemFont(ofSize: size, weight: .semibold)
        }
        func boldFontWithSize(size: CGFloat){
            self.titleLabel?.font = AppDefaults.shared.langauge().isArabic() ? UIFont(name: "Courier-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold) : UIFont.systemFont(ofSize: size, weight: .bold)
        }
    

    
}

