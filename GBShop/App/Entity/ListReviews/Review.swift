//
//  Review.swift
//  GBShop
//
//  Created by Сергей Горячев on 01.10.2021.
//

import Foundation

struct Review: Codable {
    let idUser: Int
    let idComment: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case idComment = "id_comment"
        case text = "text"
    }
}
