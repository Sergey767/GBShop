//
//  PayBasketRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 03.10.2021.
//

import Foundation
import Alamofire

protocol PayBasketRequestFactory {
    func payBasket(idUser: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void)
}
