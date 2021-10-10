//
//  AddToBasket.swift
//  GBShop
//
//  Created by Сергей Горячев on 02.10.2021.
//

import Foundation
import Alamofire

class AddToBasket: AbstractRequestFactory {
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

extension AddToBasket: AddToBasketRequestFactory {
    func addProductToBasket(idProduct: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void) {
        let requestModel = Basket(idProduct: idProduct, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddToBasket {
    struct Basket: RequestRouter {
        let method: HTTPMethod = .post
        let path: String = "addProductToBasket"
        
        let idProduct: Int
        let quantity: Int
        
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
                "quantity": quantity
            ]
        }
    }
}
