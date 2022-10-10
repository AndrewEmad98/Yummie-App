//
//  Dish.swift
//  Yummie
//
//  Created by Andrew Emad on 07/10/2022.
//

import Foundation

struct Dish:Codable {
    let id,name,description,image : String?
    let calories : Int?
    var formattedCaloriy : String {
        return "Caloreies: \(calories ?? 0)"
    }
}
