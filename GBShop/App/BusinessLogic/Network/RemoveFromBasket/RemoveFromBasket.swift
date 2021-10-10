//
//  RemoveFromBasket.swift
//  GBShop
//
//  Created by Сергей Горячев on 02.10.2021.
//

import Foundation
import Alamofire

class RemoveFromBasket: AbstractRequestFactory {
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

extension RemoveFromBasket: RemoveFromBasketRequestFactory {
    func removeProductFromBasket(idProduct: Int, completionHandler: @escaping (AFDataResponse<RemoveFromBasketResult>) -> Void) {
        let requestModel = Basket(idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RemoveFromBasket {
    struct Basket: RequestRouter {
        let method: HTTPMethod = .post
        let path: String = "removeProductFromBasket"
        
        let idProduct: Int
        
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
}
