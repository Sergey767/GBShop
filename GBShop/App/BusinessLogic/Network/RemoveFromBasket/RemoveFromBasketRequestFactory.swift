//
//  RemoveFromBasketRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 02.10.2021.
//

import Foundation
import Alamofire

protocol RemoveFromBasketRequestFactory {
    func removeProductFromBasket(idProduct: Int, completionHandler: @escaping (AFDataResponse<RemoveFromBasketResult>) -> Void)
}
