//
//  GetProductVariantRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 23.08.2021.
//

import Foundation
import Alamofire

protocol GetProductVariantRequestFactory {
    func getProductVariant(idProduct: Int, completionHandler: @escaping (AFDataResponse<ProductVariantResult>) -> Void)
}
