//
//  GetProductVariantRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 23.08.2021.
//

import XCTest
@testable import GBShop

class GetProductVariantRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var productVariant: GetProductVariantRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        productVariant = requestFactory?.makeGetProductVariantRequestFactory()
    }

    func testGetProductVariant() throws {
        // Given
        let idProduct = 123
        
        // When
        let getProductVariant = expectation(description: "get product variant")
        let productVariant = try XCTUnwrap(productVariant)
        productVariant.getProductVariant(idProduct: idProduct) { response in
            // Then
            switch response.result {
            case .success(let productVariant):
                print(productVariant)
                getProductVariant.fulfill()
                XCTAssertEqual(productVariant.productName, "Ноутбук")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    override func tearDownWithError() throws {
        requestFactory = nil
        productVariant = nil
    }
}
