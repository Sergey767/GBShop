//
//  ProductListRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 22.08.2021.
//

import Foundation
import Alamofire

protocol ProductListRequestFactory {
    func getProductsList(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<ProductListResult>) -> Void)
}
