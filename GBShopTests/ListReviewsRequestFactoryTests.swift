//
//  ListReviewsRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 30.09.2021.
//

import XCTest
@testable import GBShop

class ListReviewsRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var listReview: ListReviewsRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        listReview = requestFactory?.makeListReviewsRequestFactory()
    }
    
    func testListReview() throws {
        // Given
        let pageNumber = 1
        let idCategory = 1
        
        // When
        let getListReview = expectation(description: "get review list")
        let listReview = try XCTUnwrap(listReview)
        listReview.getListReviews(pageNumber: pageNumber, idCategory: idCategory) { response in
            // Then
            switch response.result {
            case .success(let listReview):
                print(listReview)
                getListReview.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        listReview = nil
    }
}
