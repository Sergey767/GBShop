//
//  AddReviewRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 24.09.2021.
//

import XCTest
@testable import GBShop

class AddReviewRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var addReview: AddReviewRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        addReview = requestFactory?.makeAddReviewRequestFactory()
    }

    func testAddReview() throws {
        // Given
        let idUser = 123
        let textReview = "Текст отзыва"
        
        // When
        let userAddedReview = expectation(description: "user added a review")
        let addReview = try XCTUnwrap(addReview)
        
        addReview.addReview(idUser: idUser, textReview: textReview) { response in
            // Then
            switch response.result {
            case .success(let addReview):
                print(addReview)
                XCTAssertEqual(addReview.userMessage, "Ваш отзыв был передан на модерацию")
                userAddedReview.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    override func tearDownWithError() throws {
        requestFactory = nil
        addReview = nil
    }
}
