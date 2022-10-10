//
//  AllCategories.swift
//  Yummie
//
//  Created by Andrew Emad on 10/10/2022.
//

import Foundation

struct AllCategories: Codable{
    let categories:[DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
