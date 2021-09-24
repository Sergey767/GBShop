//
//  LoginResult.swift
//  GBShop
//
//  Created by Сергей Горячев on 15.08.2021.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let id: Int
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
