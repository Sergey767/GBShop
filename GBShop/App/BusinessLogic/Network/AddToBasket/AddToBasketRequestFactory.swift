//
//  AddToBasketRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 02.10.2021.
//

import Foundation
import Alamofire

protocol AddToBasketRequestFactory {
    func addProductToBasket(idProduct: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
}
