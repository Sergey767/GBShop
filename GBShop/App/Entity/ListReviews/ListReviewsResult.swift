//
//  ListReviewsResult.swift
//  GBShop
//
//  Created by Сергей Горячев on 30.09.2021.
//

import Foundation

struct ListReviewsResult: Codable {
    let pageNumber: Int
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case reviews
    }
}
