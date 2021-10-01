//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 16.08.2021.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
