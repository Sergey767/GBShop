//
//  ChangeDataRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 16.08.2021.
//

import Foundation
import Alamofire

protocol ChangeDataRequestFactory {
    func changeUserData(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeDataResult>) -> Void)
}
