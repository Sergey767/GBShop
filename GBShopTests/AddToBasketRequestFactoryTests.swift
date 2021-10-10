//
//  AddToBasketRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 02.10.2021.
//

import XCTest
@testable import GBShop

class AddToBasketRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var addToBasket: AddToBasketRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        addToBasket = requestFactory?.makeAddToBasketRequestFactory()
    }

    func testAddToBasket() throws {
        // Given
        let idProduct = 123
        let quantity = 1
        
        // When
        let userAddedProductToBasket = expectation(description: "the user added a product to the basket")
        let addToBasket = try XCTUnwrap(addToBasket)
        addToBasket.addProductToBasket(idProduct: idProduct, quantity: quantity) { response in
            // Then
            switch response.result {
            case .success(let addToBasket):
                print(addToBasket)
                userAddedProductToBasket.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        addToBasket = nil
    }
}
