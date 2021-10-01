//
//  ListReviews.swift
//  GBShop
//
//  Created by Сергей Горячев on 30.09.2021.
//

import Foundation
import Alamofire

class ListReviews: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ListReviews: ListReviewsRequestFactory {
    func getListReviews(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<ListReviewsResult>) -> Void) {
        let requestModel = Reviews(pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ListReviews {
    struct Reviews: RequestRouter {
        let method: HTTPMethod = .post
        let path: String = "ListReviews"
        
        let pageNumber: Int
        let idCategory: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory
            ]
        }
    }
}
