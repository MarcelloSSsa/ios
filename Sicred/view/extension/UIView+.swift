//
//  UIView+.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 13/11/20.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
