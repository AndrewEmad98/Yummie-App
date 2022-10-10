//
//  Route.swift
//  Yummie
//
//  Created by Andrew Emad on 09/10/2022.
//

import Foundation

enum Route {
    static let baseURL = "https://yummie.glitch.me"
    case fetchAllCategories
    case PlaceOrder
    case FetchDishesByCategory(categoryID: String)
    case dishCategories
    
    var fullURLPath : String {
        switch self {
        case .fetchAllCategories:
            return Self.baseURL + "/dish-categories"
        case .FetchDishesByCategory(let categoryID):
            return Self.baseURL + "/dishes/\(categoryID)"
        case .PlaceOrder:
            return Self.baseURL + "/dish-categories"
        case .dishCategories:
            return Self.baseURL + "/dishes/cat1"
        }
    }
}
