//
//  ApproveReviewRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 24.09.2021.
//

import Foundation
import Alamofire

protocol ApproveReviewRequestFactory {
    func approveReview(idComment: Int, completionHandler: @escaping (AFDataResponse<ApproveReviewResult>) -> Void)
}
