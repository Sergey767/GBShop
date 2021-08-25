//
//  ProductVariant.swift
//  GBShop
//
//  Created by Сергей Горячев on 23.08.2021.
//

import Foundation
import Alamofire

class ProductVariant: AbstractRequestFactory {
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

extension ProductVariant: GetProductVariantRequestFactory {
    func getProductVariant(idProduct: Int, completionHandler: @escaping (AFDataResponse<ProductVariantResult>) -> Void) {
        let requestModel = GetProductVariant(idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductVariant {
    struct GetProductVariant: RequestRouter {
        var method: HTTPMethod = .get
        var path: String = "getGoodById.json"
        
        let idProduct: Int
        
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
        
    }
}
