//
//  ProductList.swift
//  GBShop
//
//  Created by Сергей Горячев on 22.08.2021.
//

import Foundation
import Alamofire

class ProductList: AbstractRequestFactory {
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

extension ProductList: ProductListRequestFactory {
    func getProductsList(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[ProductListResult]>) -> Void) {
        let requestModel = Products(pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductList {
    struct Products: RequestRouter {
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
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
