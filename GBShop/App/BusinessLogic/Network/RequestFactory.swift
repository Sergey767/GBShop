//
//  RequestFactory.swift
//  GBShop
//
//  Created by Сергей Горячев on 15.08.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegisterRequestFactory() -> RegisterRequestFactory {
        let errorParser = makeErrorParser()
        return Register(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeDataRequestFactory() -> ChangeDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeProductListRequestFactory() -> ProductListRequestFactory {
        let errorParser = makeErrorParser()
        return ProductList(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetProductVariantRequestFactory() -> GetProductVariantRequestFactory {
        let errorParser = makeErrorParser()
        return ProductVariant(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAddReviewRequestFactory() -> AddReviewRequestFactory {
        let errorParser = makeErrorParser()
        return AddReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeApproveReviewRequestFactory() -> ApproveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return ApproveReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRemoveReviewRequestFactory() -> RemoveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return RemoveReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeListReviewsRequestFactory() -> ListReviewsRequestFactory {
        let errorParser = makeErrorParser()
        return ListReviews(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}

