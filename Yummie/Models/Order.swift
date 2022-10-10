//
//  Order.swift
//  Yummie
//
//  Created by Andrew Emad on 09/10/2022.
//

import Foundation

struct Order: Codable {
    let id : String?
    let name : String?
    let dish : Dish?
}
