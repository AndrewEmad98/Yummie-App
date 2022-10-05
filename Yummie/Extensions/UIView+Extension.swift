//
//  UIView+Extension.swift
//  Yummie
//
//  Created by Andrew Emad on 04/10/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornorRadios : CGFloat {
        get{
            return self.cornorRadios
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
