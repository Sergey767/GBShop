//
//  PayBasket.swift
//  GBShop
//
//  Created by Сергей Горячев on 03.10.2021.
//

import Foundation
import Alamofire

class PayBasket: AbstractRequestFactory {
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

extension PayBasket: PayBasketRequestFactory {
    func payBasket(idUser: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void) {
        let requestModel = UserPayBasket(idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension PayBasket {
    struct UserPayBasket: RequestRouter {
        let method: HTTPMethod = .post
        let path: String = "payBasket"
        
        let idUser: Int
        
        var parameters: Parameters? {
            return [
                "id_user": idUser
            ]
        }
    }
}
