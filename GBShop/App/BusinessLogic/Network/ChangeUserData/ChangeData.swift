//
//  ChangeData.swift
//  GBShop
//
//  Created by Сергей Горячев on 16.08.2021.
//

import Foundation
import Alamofire

class ChangeData: AbstractRequestFactory {
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

extension ChangeData: ChangeDataRequestFactory {
    func changeUserData(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeDataResult>) -> Void) {
        let requestModel = ChangeUserData(idUser: idUser, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeData {
    struct ChangeUserData: RequestRouter {
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        
        let idUser: Int
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}
