//
//  RemoveReview.swift
//  GBShop
//
//  Created by Сергей Горячев on 25.09.2021.
//

import Foundation
import Alamofire

class RemoveReview: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension RemoveReview: RemoveReviewRequestFactory {
    func removeReview(idComment: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = Review(idComment: idComment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RemoveReview {
    struct Review: RequestRouter {
        let method: HTTPMethod = .post
        let path: String = "removeReview"
        
        let idComment: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": idComment
            ]
        }
    }
}
