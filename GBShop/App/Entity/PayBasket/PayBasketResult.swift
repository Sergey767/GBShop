//
//  PayBasketResult.swift
//  GBShop
//
//  Created by Сергей Горячев on 03.10.2021.
//

import Foundation

struct PayBasketResult: Codable {
    let amount: Int
    let countGoods: Int
    
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case countGoods = "countGoods"
    }
}
