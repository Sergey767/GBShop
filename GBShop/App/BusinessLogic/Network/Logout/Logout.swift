//
//  Logout.swift
//  GBShop
//
//  Created by Сергей Горячев on 16.08.2021.
//

import Foundation
import Alamofire

class Logout: AbstractRequestFactory {
    var errorParser: AbstractErrorParser    
    var sessionManager: Session
    var queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Logout: LogoutRequestFactory {
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = LogoutUser(baseUrl: baseUrl, idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {
    struct LogoutUser: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let idUser: Int
        
        var parameters: Parameters? {
            return [
                "id_user": idUser
            ]
        }
    }
    
}
