//
//  UIViewController+Extension.swift
//  Yummie
//
//  Created by Andrew Emad on 07/10/2022.
//

import UIKit

extension UIViewController {
    static var identifier : String {
        return String(describing: self)
    }
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.identifier) as! Self
    }
}
