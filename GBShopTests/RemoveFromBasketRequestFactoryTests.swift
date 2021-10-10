//
//  RemoveFromBasketRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 02.10.2021.
//

import XCTest
@testable import GBShop

class RemoveFromBasketRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var removeFromBasket: RemoveFromBasketRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        removeFromBasket = requestFactory?.makeRemoveFromBasketRequestFactory()
    }

    func testAddToBasket() throws {
        // Given
        let idProduct = 123
        
        // When
        let userRemovedProductFromBasket = expectation(description: "the user has deleted an item from the basket")
        let removeFromBasket = try XCTUnwrap(removeFromBasket)
        removeFromBasket.removeProductFromBasket(idProduct: idProduct) { response in
            // Then
            switch response.result {
            case .success(let removeFromBasket):
                print(removeFromBasket)
                userRemovedProductFromBasket.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        removeFromBasket = nil
    }
}
