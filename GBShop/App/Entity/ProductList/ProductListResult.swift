//
//  ProductListResult.swift
//  GBShop
//
//  Created by Сергей Горячев on 22.08.2021.
//

import Foundation

struct ProductListResult: Codable {
    let idProduct: Int
    let productName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price = "price"
    }
}
