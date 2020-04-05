//
//  ViewUtilities.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import UIKit
import Kingfisher
class ViewUtilities {
    
    static let shared = ViewUtilities()
    
    private init(){
    }
    
    func showViews(views: UIView...) {
        for view in views {
            view.isHidden = false
        }
    }
    
    func hideViews(views: UIView...) {
        for view in views {
            view.isHidden = true
        }
    }
    
    // The magical Method
    func bringViewsToFront(superView: UIView, views: UIView...) { // order matters
        for view in views {
            superView.bringSubviewToFront(view)
        }
    }
    
    // The magical Method
    func setTextsColor(color: UIColor, views: UIView...) {
        for v in views {
            if (v.isKind(of: UILabel.self)) {
                (v as! UILabel).textColor = color
            } else if (v.isKind(of: UITextField.self)) {
                (v as! UITextField).textColor = color
            } else if (v.isKind(of: UIButton.self)) {
                (v as! UIButton).setTitleColorForAllStates(color)
            }
        }
    }
    
    func circularView(views: UIView...) {
        for view in views {
            view.layer.cornerRadius = view.bounds.width / 2
        }
    }
    
    func setTextFont(fontWeight: SystemFontWeightEnum, fontSize: CGFloat, views: UIView...) { // order matters
        for v in views {
            if (v.isKind(of: UILabel.self)) {
                if fontWeight == .light {
                    (v as! UILabel).lightFontWithSize(size: fontSize)
                } else if fontWeight == .regular {
                    (v as! UILabel).regularFontWithSize(size: fontSize)
                } else if fontWeight == .medium {
                    (v as! UILabel).mediumFontWithSize(size: fontSize)
                } else if fontWeight == .bold {
                    (v as! UILabel).boldFontWithSize(size: fontSize)
                }
            } else if (v.isKind(of: UITextField.self)) {
                if fontWeight == .light {
                    (v as! UITextField).lightFontWithSize(size: fontSize)
                } else if fontWeight == .regular {
                    (v as! UITextField).regularFontWithSize(size: fontSize)
                } else if fontWeight == .medium {
                    (v as! UITextField).mediumFontWithSize(size: fontSize)
                } else if fontWeight == .bold {
                    (v as! UITextField).boldFontWithSize(size: fontSize)
                }
            }
            else if (v.isKind(of: UIButton.self)) {
                if fontWeight == .light {
                    (v as! UIButton).lightFontWithSize(size: fontSize)
                } else if fontWeight == .regular {
                    (v as! UIButton).regularFontWithSize(size: fontSize)
                } else if fontWeight == .medium {
                    (v as! UIButton).mediumFontWithSize(size: fontSize)
                } else if fontWeight == .bold {
                    (v as! UIButton).boldFontWithSize(size: fontSize)
                }
            }
        }
    }
    
    func transform(scaleX: CGFloat, y: CGFloat, views: UIView...) {
        for view in views {
            view.transform = CGAffineTransform(scaleX: scaleX, y: y)
        }
    }
    
    func setTexts(textForView: [UIView: String]) {
        for (view, text) in textForView {
            if view.isKind(of: UILabel.self) {
                (view as! UILabel).text = text.localized
            } else if view.isKind(of: UITextField.self) {
                (view as! UITextField).text = text.localized
            }
        }
    }
    
    func setImages(nameForImage: [UIImageView: String]) {
        for (image, name) in nameForImage {
            image.image = UIImage(named: name)
        }
    }
    
    func setImages(urlForImage: [UIImageView: String]) {
        for (image, url) in urlForImage {
            image.kf.indicatorType = .activity
            image.kf.setImage(with: URL(string: url))
        }
    }
}
