//
//  ListReviewsRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 30.09.2021.
//

import Foundation
import Alamofire

protocol ListReviewsRequestFactory {
    func getListReviews(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<ListReviewsResult>) -> Void)
}
