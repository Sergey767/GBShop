//
//  ProductListRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 23.08.2021.
//

import XCTest
@testable import GBShop

class ProductListRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var productList: ProductListRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        productList = requestFactory?.makeProductListRequestFactory()
    }
    
    func testProductList() throws {
        // Given
        let pageNumber = 1
        let idCategory = 1
        
        // When
        let getProductList = expectation(description: "get product list")
        let productList = try XCTUnwrap(productList)
        productList.getProductsList(pageNumber: pageNumber, idCategory: idCategory) { response in
            // Then
            switch response.result {
            case .success(let productList):
                print(productList)
                getProductList.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    override func tearDownWithError() throws {
        requestFactory = nil
        productList = nil
    }
}
