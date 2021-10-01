//
//  RegisterRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 15.08.2021.
//

import Foundation
import Alamofire

protocol RegisterRequestFactory {
    func register(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void)
}
