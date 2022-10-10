//
//  APIResponse.swift
//  Yummie
//
//  Created by Andrew Emad on 10/10/2022.
//

import Foundation

struct APIResponse<T:Decodable>: Decodable {
    let status: Int
    let message: String
    let data: T?
    let error: String?
}
