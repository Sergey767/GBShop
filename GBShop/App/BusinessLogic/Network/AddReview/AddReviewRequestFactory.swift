//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 24.09.2021.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(idUser: Int, textReview: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
}
