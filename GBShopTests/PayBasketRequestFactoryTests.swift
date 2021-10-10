//
//  PayBasketRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 03.10.2021.
//

import XCTest
@testable import GBShop

class PayBasketRequestFactoryTests: XCTestCase {

    var requestFactory: RequestFactory?
    var payBasket: PayBasketRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        payBasket = requestFactory?.makePayBasketRequestFactory()
    }

    func testPayBasket() throws {
        // Given
        let idUser = 123
        
        // When
        let userPayBasket = expectation(description: "the funds were debited and the basket was reset")
        let payBasket = try XCTUnwrap(payBasket)
        payBasket.payBasket(idUser: idUser) { response in
            // Then
            switch response.result {
            case .success(let payBasket):
                print(payBasket)
                userPayBasket.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        payBasket = nil
    }
}
