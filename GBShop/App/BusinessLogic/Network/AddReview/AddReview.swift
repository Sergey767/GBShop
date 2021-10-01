//
//  AddReview.swift
//  GBShop
//
//  Created by Сергей Горячев on 24.09.2021.
//

import Foundation
import Alamofire

class AddReview: AbstractRequestFactory {
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

extension AddReview: AddReviewRequestFactory {
    func addReview(idUser: Int, textReview: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = Review(idUser: idUser, textReview: textReview)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddReview {
    struct Review: RequestRouter {
        let method: HTTPMethod = .post
        let path: String = "addReview"
        
        let idUser: Int
        let textReview: String
        
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "text": textReview
            ]
        }
    }
}
