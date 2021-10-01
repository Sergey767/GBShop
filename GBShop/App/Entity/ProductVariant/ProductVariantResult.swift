//
//  ProductVariantResult.swift
//  GBShop
//
//  Created by Сергей Горячев on 23.08.2021.
//

import Foundation

struct ProductVariantResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}
