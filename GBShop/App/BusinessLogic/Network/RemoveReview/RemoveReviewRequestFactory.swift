//
//  RemoveReviewRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 25.09.2021.
//

import Foundation
import Alamofire

protocol RemoveReviewRequestFactory {
    func removeReview(idComment: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
}
