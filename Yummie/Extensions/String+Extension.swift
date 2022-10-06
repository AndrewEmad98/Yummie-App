//
//  String+Extension.swift
//  Yummie
//
//  Created by Andrew Emad on 06/10/2022.
//

import Foundation

extension String {
    var toURl : URL? {
        return URL(string: self)
    }
}
