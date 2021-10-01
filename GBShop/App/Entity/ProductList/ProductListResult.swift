//
//  ProductListResult.swift
//  GBShop
//
//  Created by Сергей Горячев on 22.08.2021.
//

import Foundation

struct ProductListResult: Codable {
    
    let pageNumber: Int
    let products: [Product]

    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products
    }
}
