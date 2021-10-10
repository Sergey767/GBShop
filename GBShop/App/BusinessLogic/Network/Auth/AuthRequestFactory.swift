//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 15.08.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
