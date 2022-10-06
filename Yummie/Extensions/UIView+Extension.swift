//
//  UIView+Extension.swift
//  Yummie
//
//  Created by Andrew Emad on 04/10/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadios : CGFloat {
        get{
            return self.cornerRadios
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
