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
    case PlaceOrder(dishID: String)
    case FetchDishesByCategory(categoryID: String)
    case getOrders
    
    var fullURLPath : String {
        switch self {
        case .fetchAllCategories:
            return Self.baseURL + "/dish-categories"
        case .FetchDishesByCategory(let categoryID):
            return Self.baseURL + "/dishes/\(categoryID)"
        case .PlaceOrder(let dishID):
            return Self.baseURL + "/orders/\(dishID)"
        case .getOrders:
            return Self.baseURL + "/orders"
        }
    }
}
