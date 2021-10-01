//
//  ApproveReview.swift
//  GBShop
//
//  Created by Сергей Горячев on 24.09.2021.
//

import Foundation
import Alamofire

class ApproveReview: AbstractRequestFactory {
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

extension ApproveReview: ApproveReviewRequestFactory {
    func approveReview(idComment: Int, completionHandler: @escaping (AFDataResponse<ApproveReviewResult>) -> Void) {
        let requestModel = Review(idComment: idComment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ApproveReview {
    struct Review: RequestRouter {
        let method: HTTPMethod = .post
        let path: String = "approveReview"
        
        let idComment: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": idComment
            ]
        }
    }
}
